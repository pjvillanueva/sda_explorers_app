import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test2Questions = [
  Question(
    id: 'T2Q1',
    text: 'Natutunan na ba ninyo ang talatang-sauluhin sa araling ito?',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T2Q2',
    text:
        'Sang-ayon sa 2 Pedro 1:21, ang Banal na Kasulatan ay isinulat ng #longblank sa pamamagitan ng #shortblank (Par. 1).',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T2Q3',
    text: 'Tandaan ang mga pangungusap na ito kung totoo o hindi totoo:',
    choices: [
      'May animnapu\'t walong aklat sa Lumang Tipan',
      'Mga tatlumpung lalaki ang sumulat sa Aklat ng Lumang Tipan',
      'Isinulat nila ang kanilang mga pangitain sapagkat sila\'y hinihilingan ng Dios na gawain yaon.',
      'Ang mga manunulat sa Bagong Tipan ay hindi kailan man sumipi mula sa Lumang Tipan'
    ],
    type: QuestionType.choiceMultiple,
  ),
  Question(
    id: 'T2Q4',
    text: 'Bakit hindi sumipi si Jesus sa Bagong Tipan? #longblank (Par.1)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T2Q5',
    text:
        'Sinasabi ni Pablo sa 2 Timoteo 3:16, na #shortblank ng mga kasulatan ay #shortblank ng Dios at mapapakinabangan din naman sa #longblank (Par. 5)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T2Q6',
    text: 'Ano ang sinasabi ni Isaias na magagawa ng Dios lamang? #shortblank',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T2Q7',
    text: 'Magsabi ng tatlong bagay na nangyari sa Babilonia.',
    answersNeeded: 3,
    type: QuestionType.enumerate,
  ),
  Question(
    id: 'T2Q8',
    text:
        'Ang lalaking tinawag sa pangalan nang mahigit na sa isandaang taon bago siya ipinanganak ay pinangalanang #shortblank at winasak niya ang lungsod ng #shortblank (Par. 7)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T2Q9',
    text:
        'Nangako ang Dios na ipapahayag Niya ang dumarating na mga pangyayari sa Kanyang mga lingkod na #longblank (Par. 8).',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T2Q10',
    text:
        'Ang #shortblank ay malakas kaysa alin mang bagay sa sanlibutang ito. Ito\'y matalas kaysa #shortblank at nagtuturo ng daan sa walang hanggang #shortblank lahat ng sumusunod dito. (Par. 9, 10)',
    type: QuestionType.fillBlanks,
  ),
];