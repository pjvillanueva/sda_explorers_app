import 'package:flutter/material.dart';

class QuestionWithBlanks extends StatefulWidget {
  final String question;
  final Function(List<String>) onAnswersChanged;

  const QuestionWithBlanks({
    Key? key,
    required this.question,
    required this.onAnswersChanged,
  }) : super(key: key);

  @override
  _QuestionWithBlanksState createState() => _QuestionWithBlanksState();
}

class _QuestionWithBlanksState extends State<QuestionWithBlanks> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    RegExp exp = RegExp(r'#(long|short)blank');
    controllers = List.generate(
      exp.allMatches(widget.question).length,
      (index) => TextEditingController(),
    );

    for (var controller in controllers) {
      controller.addListener(_notifyAnswerChange);
    }
  }

  void _notifyAnswerChange() {
    List<String> answers = controllers.map((c) => c.text).toList();
    widget.onAnswersChanged(answers);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.removeListener(_notifyAnswerChange);
      controller.dispose();
    }
    super.dispose();
  }

  Widget buildTextWithInputs() {
    List<InlineSpan> spans = [];
    RegExp exp = RegExp(r'#(long|short)blank');
    int lastMatchEnd = 0;
    int controllerIndex = 0;

    for (Match match in exp.allMatches(widget.question)) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
            text: widget.question.substring(lastMatchEnd, match.start)));
      }

      spans.add(WidgetSpan(
        child: SizedBox(
          width: match.group(1) == 'long' ? 300 : 150,
          child: TextField(
            controller: controllers[controllerIndex++],
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
            ),
          ),
        ),
      ));

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < widget.question.length) {
      spans.add(TextSpan(text: widget.question.substring(lastMatchEnd)));
    }

    return RichText(
        text: TextSpan(
            children: spans,
            style: const TextStyle(fontSize: 16, color: Colors.black)));
  }

  @override
  Widget build(BuildContext context) {
    return buildTextWithInputs();
  }
}
