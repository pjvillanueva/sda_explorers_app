import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test11Questions = [
  Question(
    id: 'T11Q1',
    text: 'Natutuhan ba ninyo ang talatang sauluhin? Sagutin ng OO o Hindi',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T11Q2',
    text: 'Ang buong tungkulin ng tao ay #shortblank at #shortblank (Par. 1)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T11Q3',
    text: 'Isinulat ng Dios ang Sampung Utos sa mga Tapyas ng #shortblank',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T11Q4',
    text: 'Ang kautusan ng Dios ay mananatili #shortblank (par. 3)',
    type: QuestionType.fillBlanks,
  ),
  Question(
      id: 'T11Q5',
      text:
          'Lagyan ng guhit na krus ang maling pangungusap sa sumusunod: (Par. 3)',
      type: QuestionType.falseMultiple,
      choices: [
        'Ang Sampung Utos ay pinawi sa krus',
        'Ang taong mag-alis ng bahagi sa kautusan ng Dios ay kikilalanin ng langit na pinakamasamang mangdaraya.',
        'Naparito si Jesus upang baguhin ang Sampung Utos.',
        'Tinupad ni Jesus ang Sampung Utos.'
      ]),
  Question(
    id: 'T11Q6',
    text: 'Kung lalabagin nating ang #shortblank sa Sampung Utos tayo ay nagiging makasalanan sa #shortblank (par. 5)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T11Q7',
    text: 'Ipinakikita natin sa pagtupad ng Sampung Utos na #shortblank si Jesus. (Par. 6)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T11Q8',
    text: 'Ang kasalanan ay #shortblank sa #shortblank at ang kabayaran ng #shortblank ay #shortblank (Par. 7)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T11Q9',
    text: 'Sapagka\'t tayo ay iniligtas ng biyaya sa pamamagitan ng dugo ni Jesus, dapat tayong maging higit na maingat sa pagtupad ng #shortblank (Par. 8)',
    type: QuestionType.fillBlanks,
  ),
];