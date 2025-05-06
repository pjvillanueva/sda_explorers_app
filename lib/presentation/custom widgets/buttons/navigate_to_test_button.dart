import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/question.dart';
import 'package:sda_explorers_app/data/tests/dummy_test_creator.dart';
import 'package:sda_explorers_app/data/tests/test_1.dart';
import 'package:sda_explorers_app/data/tests/test_2.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/snackbar.dart';
import 'package:sda_explorers_app/presentation/screens/Test/test_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigateToTest extends StatelessWidget {
  const NavigateToTest({super.key, required this.testNumber});

  final int testNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  state.role?.roleName == 'Guest' ? Colors.grey : Colors.blue)),
          onPressed: () {
            if (state.role?.roleName == 'Guest') {

              AppSnackBar.show(context, message: AppLocalizations.of(context)!.lessonTestGuestWarning, type: SBMessageType.info);
              return;
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TestScreen(
                          title: AppLocalizations.of(context)!
                              .lessonTestNumber(testNumber),
                          questions: _getQuestions(testNumber),
                        )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: state.role?.roleName == 'Guest',
                child: const Icon(Icons.lock, color: Colors.white)),
              const SizedBox(width: 10),
              Text(
                AppLocalizations.of(context)!.lessonTakeTest,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}

_getQuestions(int testNumber) {
  switch (testNumber) {
    case 1:
      return test1Questions;
    case 2:
      return test2Questions;
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
    final generator =
        questionGenerators[random.nextInt(questionGenerators.length)];
    return generator();
  });
}
