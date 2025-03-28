import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestState extends Equatable {
  final int currentQuestion;
  final int totalQuestions;
  final Map<String, dynamic> answers;

  const TestState(
      {required this.currentQuestion,
      required this.totalQuestions,
      required this.answers});

  @override
  List<Object> get props => [currentQuestion, totalQuestions, answers];


  get isLastQuestion {
    return currentQuestion == totalQuestions - 1;
  }

  TestState copyWith({
    int? currentQuestion,
    int? totalQuestions,
    Map<String, dynamic>? answers,
  }) {
    return TestState(
      currentQuestion: currentQuestion ?? this.currentQuestion,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      answers: answers ?? this.answers,
    );
  }
}

class TestCubit extends Cubit<TestState> {
  TestCubit()
      : super(const TestState(
            currentQuestion: 0, totalQuestions: 0, answers: {}));

  void setInitialValue(int totalQuestions) {
    emit(TestState(
        currentQuestion: 0, totalQuestions: totalQuestions, answers: const {}));
  }

  back() {
    if (state.currentQuestion > 0) {
      emit(state.copyWith(currentQuestion: state.currentQuestion - 1));
    }
  }

  void submit(String questionId, dynamic answer) {
    //save answer
    Map<String, dynamic> newAnswers = Map.from(state.answers);
    newAnswers[questionId] = answer;
    emit(state.copyWith(answers: newAnswers));
    //submit or proceed to next question
    if (state.currentQuestion < state.totalQuestions - 1) {
      emit(state.copyWith(currentQuestion: state.currentQuestion + 1));
    } else {
      print('Submit all answers: ${state.answers}');
    }
    print('SUBMIT: Answers: ${state.answers}');
  }

  dynamic loadAnswer(String questionId) {
    return state.answers[questionId];
  }
}
