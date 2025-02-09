enum QuestionType {
  choiceSingle,
  choiceMultiple,
  fillBlanks,
  trueOrFalse,
  freeText,
  enumerate
}

class Question {
  Question(
      {required this.id,
      required this.text,
      required this.type,
      this.answer,
      this.readOnly = false,
      this.isChecked = false,
      this.isCorrect,
      this.instructionText,
      this.choices = const [],
      this.answersNeeded = 1});
  String id;
  String text;
  QuestionType type;
  List<String> choices;
  bool readOnly;
  bool isChecked;
  dynamic answer;
  bool? isCorrect;
  String? instructionText;
  int answersNeeded;
}
