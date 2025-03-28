import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sda_explorers_app/data/models/question.dart';
import 'package:sda_explorers_app/data/tests/dummy_test_creator.dart';
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
                        // questions: test1Questions,
                        questions: generateRandomQuestions(10))));
      },
      child: const Text(
        'ANSWER LESSON TEST',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

_getQuestions(int testNumber) {
  switch (testNumber) {
    case 1:
      return test1Questions;
    default:
      return test1Questions;
  }
}

List<Question> generateRandomQuestions(int count) {
  final random = Random();
  final questionGenerators = [
    freeTextQ,
    enumerateQ,
    fillBlanksQ,
    choiceSingleQ,
    choiceMultiple,
    trueOrFalseQ
  ];

  return List.generate(count, (_) {
    final generator = questionGenerators[random.nextInt(questionGenerators.length)];
    return generator();
  });
}