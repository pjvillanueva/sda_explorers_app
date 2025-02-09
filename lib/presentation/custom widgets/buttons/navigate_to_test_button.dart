import 'package:flutter/material.dart';
import 'package:sda_explorers_app/data/tests/test_1.dart';
import 'package:sda_explorers_app/presentation/screens/Test/test_screen.dart';

class NavigateToTest extends StatelessWidget {
  const NavigateToTest({super.key, required this.testNumber});

  final int testNumber;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TestScreen(
                      title: 'Lesson $testNumber Test',
                      questions: test1Questions,
                    )));
      },
      child: const Text(
        'ANSWER LESSON TEST',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

//TODO: Solve bugs
//Choices type select the same answer
//Something went wrong in the last two fill blanks question

_getQuestions(int testNumber) {
  switch (testNumber) {
    case 1:
      return test1Questions;
    default:
      return test1Questions;
  }
}
