class UserAnswers {
  String id;
  String userId;
  List<Answer> answers;
  UserAnswers({required this.id, required this.answers, required this.userId});
}

class Answer {
  String id;
  String lessonNumber;
  Map<int, dynamic> answers;

  Answer({required this.id, required this.lessonNumber, required this.answers});
}