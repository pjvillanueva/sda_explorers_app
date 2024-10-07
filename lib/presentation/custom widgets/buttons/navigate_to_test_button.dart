import 'package:flutter/material.dart';
import 'package:sda_explorers_app/presentation/screens/tests%20screens/lesson_1_test_screen.dart';

class NavigateToTest extends StatelessWidget {
  const NavigateToTest(
      {super.key, required this.testNumber, required this.testContents});

  final int testNumber;
  final Map<String, String> testContents;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Lesson1TestScreen()));
      },
      child: const Text(
        'ANSWER LESSON TEST',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
