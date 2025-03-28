import 'dart:math';
import 'package:sda_explorers_app/data/models/question.dart';

String _generateUniqueId() {
  final random = Random();
  return (10000 + random.nextInt(90000)).toString();
}

freeTextQ() {
  return Question(
      id: _generateUniqueId(),
      text: "This is a sample free text question",
      type: QuestionType.freeText);
}

enumerateQ({int? answersNeeded}) {
  return Question(
      id: _generateUniqueId(),
      text: 'This is a sample enumerate question',
      type: QuestionType.enumerate,
      answersNeeded: answersNeeded ?? 3);
}

fillBlanksQ({String? text}) {
  return Question(
      id: _generateUniqueId(),
      text: text ??
          'This is sample fill blanks question. First blank #shortblank , Second blank #shortblank, Last blank #longblank',
      type: QuestionType.fillBlanks);
}

choiceSingleQ({List<String>? choices}) {
  return Question(
      id: _generateUniqueId(),
      text: 'This is a sample choice single question',
      type: QuestionType.choiceSingle,
      choices: choices ?? ['Choice 1', 'Choice 2', 'Choice 3']);
}

choiceMultiple({List<String>? choices}) {
  return Question(
      id: _generateUniqueId(),
      text: 'This is a sample choice multiple question',
      type: QuestionType.choiceMultiple,
      choices: choices ?? ['Choice 1', 'Choice 2', 'Choice 3']);
}

trueOrFalseQ() {
  return Question(
    id: _generateUniqueId(),
    text: 'This is a sample choice true or false question',
    type: QuestionType.trueOrFalse,
  );
}
