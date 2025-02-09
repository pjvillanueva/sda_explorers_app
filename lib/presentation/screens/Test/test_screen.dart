import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/question.dart';
import 'package:sda_explorers_app/logic/cubits/test_cubit.dart';
import 'package:sda_explorers_app/presentation/screens/Test/widgets/question_content.dart';
import 'package:sda_explorers_app/presentation/screens/Test/widgets/test_progress_indicator.dart';

class TestScreen extends StatelessWidget {
  final String title;
  final List<Question> questions;

  const TestScreen({
    Key? key,
    required this.title,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: BlocProvider<TestCubit>(
            create: (context) => TestCubit()..setInitialValue(questions.length),
            child: BlocBuilder<TestCubit, TestState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      TestProgressIndicator(
                        currentStep: state.currentQuestion,
                        numberOfQuestions: questions.length,
                      ),
                      const SizedBox(height: 30),
                      getQuestionContent(questions[state.currentQuestion]),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
