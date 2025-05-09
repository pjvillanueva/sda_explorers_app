import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sda_explorers_app/data/models/answer.dart';
import 'package:sda_explorers_app/logic/cubits/user_cubit.dart';
import 'package:sda_explorers_app/logic/services/test_service.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/loading_indicator.dart';

// ignore: must_be_immutable
class TestState extends Equatable {
  final int lessonNumber;
  final int currentQuestion;
  final int totalQuestions;
  LessonAnswerState lessonAnswerState;
  final Map<String, List<Answer>> answers;

  TestState(
      {required this.lessonNumber,
      required this.currentQuestion,
      required this.totalQuestions,
      this.lessonAnswerState = LessonAnswerState.unchecked,
      required this.answers});

  @override
  List<Object> get props =>
      [lessonNumber, currentQuestion, totalQuestions, answers];

  get isLastQuestion {
    return currentQuestion == totalQuestions - 1;
  }

  TestState copyWith({
    int? lessonNumber,
    int? currentQuestion,
    int? totalQuestions,
    Map<String, List<Answer>>? answers,
  }) {
    return TestState(
      lessonNumber: lessonNumber ?? this.lessonNumber,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      answers: answers ?? this.answers,
    );
  }
}

class TestCubit extends Cubit<TestState> {
  TestCubit()
      : super(TestState(
            lessonNumber: 0,
            currentQuestion: 0,
            totalQuestions: 0,
            lessonAnswerState: LessonAnswerState.unchecked,
            answers: const {}));

  Future<void> setInitialValue(
      BuildContext context, int lessonNumber, int totalQuestions) async {
    //get user role
    final explorerAnswer = await getExplorerAnswer(context);
    Map<String, List<Answer>> saveAnswers = {};
    LessonAnswers? lessonAnswers;

    if (explorerAnswer != null) {
      for (final lesson in explorerAnswer.lessonAnswers) {
        if (lesson.lessonNumber == lessonNumber) {
          saveAnswers = lesson.answers;
          lessonAnswers = lesson;
          break;
        }
      }
    }

    print('LESSON ANSWERS: $lessonAnswers');

    emit(TestState(
        lessonNumber: lessonNumber,
        currentQuestion: 0,
        totalQuestions: totalQuestions,
        answers: saveAnswers,
        lessonAnswerState: lessonAnswers?.state ??
            LessonAnswerState.unchecked));
  }

  back() {
    if (state.currentQuestion > 0) {
      emit(state.copyWith(currentQuestion: state.currentQuestion - 1));
    }
  }

  Future<void> submit(
      BuildContext context, String questionId, List<Answer> answers) async {
    Map<String, List<Answer>> newAnswers = Map.from(state.answers);
    newAnswers[questionId] = answers;
    emit(state.copyWith(answers: newAnswers));
    //submit or proceed to next question
    if (state.currentQuestion < state.totalQuestions - 1) {
      emit(state.copyWith(currentQuestion: state.currentQuestion + 1));
    } else {
      showLoading(context);

      //Get explorerId
      final explorerId = context.read<UserCubit>().state.roleData['id'] ?? '';

      if (explorerId != '') {
        // Save answers to the database or perform any other action
        await saveAnswers(
            context: context,
            explorerId: explorerId,
            lessonNumber: state.lessonNumber,
            answers: newAnswers);
      }

      // Hide loading indicator
      Navigator.pop(context);

      //Close test screen
      Navigator.pop(context);
    }
  }

  List<Answer> loadAnswer(String questionId) {
    return state.answers[questionId] ?? [];
  }
}
