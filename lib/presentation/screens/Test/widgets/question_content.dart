import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/question.dart';
import 'package:sda_explorers_app/logic/cubits/test_cubit.dart';
import 'package:sda_explorers_app/presentation/screens/Test/widgets/question_actions.dart';
import 'package:sda_explorers_app/presentation/screens/Test/widgets/question_contents_widget.dart';
import 'package:sda_explorers_app/utils/form_validators.dart';

getQuestionContent(Question question) {
  switch (question.type) {
    case QuestionType.freeText:
      return FreeTextQuestionContent(question: question);
    case QuestionType.enumerate:
      return EnumerateQuestionContent(question: question);
    case QuestionType.fillBlanks:
      return FillInBlanksQuestionContent(question: question);
    case QuestionType.choiceSingle:
      return SingleChoiceQuestionContent(question: question);
    case QuestionType.choiceMultiple:
      return MultipleChoiceQuestionContent(question: question);
    case QuestionType.trueOrFalse:
      return TrueFalseQuestionContent(question: question);
    default:
      return Container();
  }
}

get qTextStyle => const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

//Free text question content
class FreeTextQuestionContent extends StatelessWidget {
  FreeTextQuestionContent({super.key, required this.question});

  final Question question;

  final TextEditingController _answerController =
      TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _answerController.text =
        context.read<TestCubit>().loadAnswer(question.id) ?? '';
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          question.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _answerController,
                maxLines: 10,
                decoration: const InputDecoration(
                  labelText: 'Answer',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                validator: emptyValidator,
              ),
              const SizedBox(height: 16),
              QuestionActions(
                submit: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context
                        .read<TestCubit>()
                        .submit(question.id, _answerController.text);
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class EnumerateQuestionContent extends StatefulWidget {
  const EnumerateQuestionContent({super.key, required this.question});

  final Question question;

  @override
  State<EnumerateQuestionContent> createState() =>
      _EnumerateQuestionContentState();
}

class _EnumerateQuestionContentState extends State<EnumerateQuestionContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    List<String> answers =
        context.read<TestCubit>().loadAnswer(widget.question.id) ?? [];

    controllers = List.generate(
      widget.question.answersNeeded,
      (index) => TextEditingController(
        text:
            answers.isNotEmpty && index < answers.length ? answers[index] : "",
      ),
    );
  }

  @override
  void didUpdateWidget(covariant EnumerateQuestionContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.question.id != widget.question.id) {
      _disposeControllers();
      _initializeControllers();
      setState(() {});
    }
  }

  void _disposeControllers() {
    for (var c in controllers) {
      c.dispose();
    }
    controllers.clear();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            widget.question.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(widget.question.answersNeeded, (index) {
            return EnumerateField(
                index: (index + 1).toString(), controller: controllers[index]);
          }),
          const SizedBox(height: 16),
          QuestionActions(
            submit: () {
              if (_formKey.currentState?.validate() ?? false) {
                List<String> values =
                    controllers.map((controller) => controller.text).toList();
                context.read<TestCubit>().submit(widget.question.id, values);
              }
            },
          )
        ],
      ),
    );
  }
}

class FillInBlanksQuestionContent extends StatefulWidget {
  const FillInBlanksQuestionContent({super.key, required this.question});

  final Question question;

  @override
  State<FillInBlanksQuestionContent> createState() =>
      _FillInBlanksQuestionContentState();
}

class _FillInBlanksQuestionContentState
    extends State<FillInBlanksQuestionContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllersMap = {};

  @override
  void didUpdateWidget(covariant FillInBlanksQuestionContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.question.id != widget.question.id) {
      _disposeControllers();
      setState(() {});
    }
  }

  void _disposeControllers() {
    for (var controller in controllersMap.values) {
      controller.dispose();
    }
    controllersMap.clear();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      List<String> values =
          controllersMap.values.map((controller) => controller.text).toList();

      context.read<TestCubit>().submit(widget.question.id, values);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> answers = (context
                .read<TestCubit>()
                .loadAnswer(widget.question.id) as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final spans = _processString(widget.question.text, answers);

    return Column(
      children: [
        const SizedBox(height: 16),
        if (widget.question.instructionText != null)
          Column(
            children: [
              Text(
                widget.question.instructionText!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
            ],
          ),
        Form(
          key: _formKey,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: spans,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        QuestionActions(submit: _submit),
      ],
    );
  }

  List<InlineSpan> _processString(String text, List<String>? answers) {
    final List<InlineSpan> spans = [];
    final RegExp regex = RegExp(r'#(shortblank|longblank)');
    final Iterable<RegExpMatch> matches = regex.allMatches(text);

    int currentIndex = 0;
    int blankCounter = 1;

    answers ??= List.generate(matches.length, (index) => '');

    if (answers.isNotEmpty && answers.length != matches.length) {
      spans.add(const TextSpan(text: 'Something went wrong'));
      return spans;
    }

    for (final match in matches) {
      if (currentIndex < match.start) {
        spans.add(TextSpan(text: text.substring(currentIndex, match.start)));
      }

      final uniqueKey = 'blank_$blankCounter';

      final controller = TextEditingController(
          text: answers.isEmpty ? '' : answers[blankCounter - 1]);
      controllersMap[uniqueKey] = controller;

      spans.add(WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: SizedBox(
          width: match.group(1) == 'shortblank' ? 120 : 200,
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: blankCounter.toString(),
              hintStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
          ),
        ),
      ));

      blankCounter++;
      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      spans.add(TextSpan(text: text.substring(currentIndex)));
    }

    return spans;
  }
}

class SingleChoiceQuestionContent extends StatefulWidget {
  const SingleChoiceQuestionContent({super.key, required this.question});

  final Question question;

  @override
  State<SingleChoiceQuestionContent> createState() =>
      _SingleChoiceQuestionContentState();
}

class _SingleChoiceQuestionContentState
    extends State<SingleChoiceQuestionContent> {
  int? selectedChoiceIndex;

  @override
  void initState() {
    super.initState();
    _loadAnswer();
  }

  @override
  void didUpdateWidget(covariant SingleChoiceQuestionContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question.id != widget.question.id) {
      _loadAnswer();
    }
  }

  void _loadAnswer() {
    String? answer = context.read<TestCubit>().loadAnswer(widget.question.id);
    print('LOADED ANSWER: $answer');
    if (answer != null && widget.question.choices.contains(answer)) {
      setState(() {
        selectedChoiceIndex = widget.question.choices.indexOf(answer);
      });
    } else {
      setState(() {
        selectedChoiceIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          widget.question.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(widget.question.choices.length, (index) {
          final choice = widget.question.choices[index];
          final choiceLetter = String.fromCharCode(65 + index);
          final isSelected = index == selectedChoiceIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedChoiceIndex = index;
              });
            },
            child: Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color:
                    isSelected ? Colors.green.shade900 : Colors.green.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    '$choiceLetter. ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                  Expanded(
                    child: Text(
                      choice,
                      style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? Colors.white : Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
        QuestionActions(submit: () {
          if (selectedChoiceIndex != null) {
            context.read<TestCubit>().submit(widget.question.id,
                widget.question.choices[selectedChoiceIndex!]);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Answer is required'),
              ),
            );
          }
        }),
      ],
    );
  }
}

class MultipleChoiceQuestionContent extends StatefulWidget {
  const MultipleChoiceQuestionContent({super.key, required this.question});

  final Question question;

  @override
  State<MultipleChoiceQuestionContent> createState() =>
      _MultipleChoiceQuestionContentState();
}

class _MultipleChoiceQuestionContentState
    extends State<MultipleChoiceQuestionContent> {
  Set<int> selectedChoices = {};

  @override
  void initState() {
    super.initState();
    _loadSelectedChoices();
  }

  @override
  void didUpdateWidget(covariant MultipleChoiceQuestionContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question.id != widget.question.id) {
      setState(() {
        selectedChoices.clear();
      });
      _loadSelectedChoices();
    }
  }

  void _loadSelectedChoices() {
    final answers = context.read<TestCubit>().loadAnswer(widget.question.id)
        as List<String>?;

    if (answers != null) {
      setState(() {
        for (var answer in answers) {
          final index = widget.question.choices.indexOf(answer);
          if (index != -1) {
            selectedChoices.add(index);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          widget.question.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(widget.question.choices.length, (index) {
          final choice = widget.question.choices[index];
          final choiceLetter = String.fromCharCode(65 + index);
          final isSelected = selectedChoices.contains(index);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedChoices.remove(index);
                } else {
                  selectedChoices.add(index);
                }
              });
            },
            child: Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color:
                    isSelected ? Colors.green.shade900 : Colors.green.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    '$choiceLetter. ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                  Expanded(
                    child: Text(
                      choice,
                      style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? Colors.white : Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
        QuestionActions(submit: () {
          if (selectedChoices.isNotEmpty) {
            final selectedAnswers = selectedChoices
                .map((index) => widget.question.choices[index])
                .toList();
            context
                .read<TestCubit>()
                .submit(widget.question.id, selectedAnswers);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('At least one answer is required'),
              ),
            );
          }
        }),
      ],
    );
  }
}

class TrueFalseQuestionContent extends StatefulWidget {
  const TrueFalseQuestionContent({super.key, required this.question});

  final Question question;

  @override
  State<TrueFalseQuestionContent> createState() =>
      _TrueFalseQuestionContentState();
}

class _TrueFalseQuestionContentState extends State<TrueFalseQuestionContent> {
  bool? selectedAnswer;

  @override
  void initState() {
    super.initState();
    _loadSelectedAnswer();
  }

  @override
  void didUpdateWidget(covariant TrueFalseQuestionContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question.id != widget.question.id) {
      setState(() {
        selectedAnswer = null;
      });
      _loadSelectedAnswer();
    }
  }

  void _loadSelectedAnswer() {
    String? answer = context.read<TestCubit>().loadAnswer(widget.question.id);
    if (answer != null) {
      setState(() {
        selectedAnswer = answer == 'Tama';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          widget.question.text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedAnswer = true;
            });
          },
          child: Container(
            height: 50,
            width: 300,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: selectedAnswer == true
                  ? Colors.green.shade900
                  : Colors.green.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
            child: const Center(
              child: Text(
                'Tama',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedAnswer = false;
            });
          },
          child: Container(
            height: 50,
            width: 300,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: selectedAnswer == false
                  ? Colors.green.shade900
                  : Colors.green.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
            child: const Center(
              child: Text(
                'Mali',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        QuestionActions(submit: () {
          if (selectedAnswer != null) {
            context
                .read<TestCubit>()
                .submit(widget.question.id, selectedAnswer! ? 'Tama' : 'Mali');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Answer is required'),
              ),
            );
          }
        }),
      ],
    );
  }
}

