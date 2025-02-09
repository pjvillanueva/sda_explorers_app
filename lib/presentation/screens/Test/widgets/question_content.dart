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

    List<String> answers =
        context.read<TestCubit>().loadAnswer(widget.question.id) ?? [];

    if (answers.isNotEmpty) {
      List.generate(
          answers.length,
          (index) =>
              controllers.add(TextEditingController(text: answers[index])));
    } else {
      List.generate(widget.question.answersNeeded,
          (index) => controllers.add(TextEditingController()));
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
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
  final Map<String, TextEditingController> controllers = {};

  @override
  void dispose() {
    for (var c in controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers =
        context.read<TestCubit>().loadAnswer(widget.question.id) ?? [];
    List<InlineSpan> spans = _processString(widget.question.text, answers);

    return Column(
      children: [
        const SizedBox(height: 16),
        if (widget.question.instructionText != null)
          Column(
            children: [
              Text(
                widget.question.instructionText!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
        QuestionActions(
          back: () {
            context.read<TestCubit>().back();
            controllers.clear();
          },
          submit: () {
            if (_formKey.currentState?.validate() ?? false) {
              List<String> values = controllers.values.map((controller) {
                return controller.text;
              }).toList();

              context.read<TestCubit>().submit(widget.question.id, values);
            }
          },
        ),
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
      controllers[uniqueKey] = controller;

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

    String? answer = context.read<TestCubit>().loadAnswer(widget.question.id);
    print('LOADED ANSWER');
    if (answer != null) {
      if (widget.question.choices.contains(answer)) {
        selectedChoiceIndex = widget.question.choices.indexOf(answer);
      }
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
            if (!context.read<TestCubit>().state.isLastQuestion) {
              selectedChoiceIndex = null;
            }
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
    List<String>? answers =
        context.read<TestCubit>().loadAnswer(widget.question.id);
    if (answers != null) {
      for (var answer in answers) {
        final index = widget.question.choices.indexOf(answer);
        if (index != -1) {
          selectedChoices.add(index);
        }
      }
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

    // Load saved answer if available
    String? answer = context.read<TestCubit>().loadAnswer(widget.question.id);
    if (answer != null) {
      selectedAnswer = answer == 'Tama';
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
