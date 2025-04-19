class LessonAnswer {
  String lessonNumber;
  Map<int, dynamic> answers;

  LessonAnswer({
    required this.lessonNumber,
    required this.answers,
  });
  @override
  String toString() => 'LessonAnswers: { lessonNumber: $lessonNumber, answers: $answers}';

  Map<String, dynamic> toJson() {
    return {
      'lessonNumber': lessonNumber,
      'answers': answers,
    };
  }

  factory LessonAnswer.fromJson(Map<String, dynamic> json) {
    return LessonAnswer(
      lessonNumber: json['lessonNumber'] as String,
      answers: Map<int, dynamic>.from(json['answers']),
    );
  }
}