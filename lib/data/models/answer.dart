enum AnswerState { unchecked, correct, incorrect }

class Answer {
  Answer({
    required this.answer,
    this.state = AnswerState.unchecked,
    this.score = 1, // default score for each answer is 1
  });

  AnswerState state;
  int score;
  final String answer;

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'state': state.name,
      'score': score,
    };
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      answer: json['answer'] as String,
      state: AnswerState.values.firstWhere(
          (e) => e.name == json['state'] as String,
          orElse: () => AnswerState.unchecked),
      score: json['score'] as int? ?? 1,
    );
  }

  @override
  String toString() =>
      'Answer: {state: $state, answer: $answer, score: $score}';
}

enum LessonAnswerState { unchecked, checking, checked }
class LessonAnswers {
  LessonAnswers(
      {required this.lessonNumber,
      this.lessonScore = 0,
      this.state = LessonAnswerState.unchecked,
      required this.answers});
  final int lessonNumber;
  int lessonScore;
  LessonAnswerState state;
  final Map<String, List<Answer>> answers;

  Map<String, dynamic> toJson() {
    return {
      'lessonNumber': lessonNumber,
      'lessonScore': lessonScore,
      'state': state.name,
      'answers': answers.map(
          (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList())),
    };
  }

  factory LessonAnswers.fromJson(Map<String, dynamic> json) {
    return LessonAnswers(
      lessonNumber: json['lessonNumber'] as int,
      lessonScore: json['lessonScore'] as int? ?? 0,
      state: LessonAnswerState.values.firstWhere(
          (e) => e.name == json['state'] as String,
          orElse: () => LessonAnswerState.unchecked),
      answers: (json['answers'] as Map<String, dynamic>).map((key, value) =>
          MapEntry(
              key, (value as List).map((e) => Answer.fromJson(e)).toList())),
    );
  }

  @override
  String toString() =>
      'LessonAnswers: {lessonNumber: $lessonNumber, lessonScore: $lessonScore, state: $state, answers: $answers}';
}

enum ExplorerAnswerState { unchecked, passed, failed }

class ExplorerAnswers {
  ExplorerAnswers({
    required this.explorerId,
    required this.lessonAnswers,
    this.explorerScore = 0,
    this.state = ExplorerAnswerState.unchecked,
  });
  final String explorerId;
  int explorerScore;
  ExplorerAnswerState state;
  final List<LessonAnswers> lessonAnswers;

  Map<String, dynamic> toJson() {
    return {
      'explorerId': explorerId,
      'explorerScore': explorerScore,
      'state': state.name,
      'lessonAnswers':
          lessonAnswers.map((e) => e.toJson()).toList(growable: false),
    };
  }

  factory ExplorerAnswers.fromJson(Map<String, dynamic> json) {
    return ExplorerAnswers(
      explorerId: json['explorerId'] as String,
      explorerScore: json['explorerScore'] as int? ?? 0,
      lessonAnswers: (json['lessonAnswers'] as List)
          .map((e) => LessonAnswers.fromJson(e))
          .toList(),
      state: ExplorerAnswerState.values.firstWhere(
          (e) => e.name == json['state'] as String,
          orElse: () => ExplorerAnswerState.unchecked),
    );
  }
  @override
  String toString() =>
      'ExplorerAnswers: {explorerId: $explorerId, explorerScore: $explorerScore, lessonAnswers: $lessonAnswers, state: $state}';
}
