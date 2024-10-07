enum QuestionType {
  singleChoice,
  multipleChoice,
  enumaration,
  freeText,
  trueOrFalse
}

abstract class Question {
  Question(
      {required this.id,
      required this.text,
      required this.answer,
      required this.questionType,
      required this.readOnly,
      required this.isChecked,
      required this.isCorrect});
  String id;
  String text;
  dynamic answer;
  QuestionType questionType;
  bool readOnly;
  bool isChecked;
  bool isCorrect;
}

class SingleChoiceQuestion extends Question {
  SingleChoiceQuestion(
      {required super.id,
      required super.text,
      required super.answer,
      required super.questionType,
      required super.readOnly,
      required super.isChecked,
      required super.isCorrect});
      
}
