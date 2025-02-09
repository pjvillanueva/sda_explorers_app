import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.currentStep,
    required this.numberOfQuestions,
  });

  final int currentStep;
  final int numberOfQuestions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfQuestions, (index) {
        Color color;
        if (index < currentStep) {
          color = Colors.blue;
        } else if (index == currentStep) {
          color = Colors.blue.shade700;
        } else {
          color = Colors.grey[300]!;
        }

        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            height: 4.0,
            color: color,
          ),
        );
      }),
    );
  }
}
