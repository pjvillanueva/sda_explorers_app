import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test3Questions = [
  Question(
    id: 'T3Q1',
    text: 'Natutunan na ba ninyo ang talatang-sauluhin sa araling ito?',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T3Q2',
    text:
        'Sinasabi ni Jesus, Isaias, Ezekiel at Juan na si Satanas ay nagmula sa #longblank',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T3Q3',
    text:
        'Bago nahulog si Satanas mula sa langit ang pangalan niya ay #longblank',
    type: QuestionType.fillBlanks,
  ),
  Question(
      id: 'T3Q4',
      text:
          'Ang ilan sa mga sumusunod na mga pangungusap ay totoo at ang ilan ay hindi totoo. Lagyan ng guhit na krus ang hindi totoo.',
      type: QuestionType.falseMultiple,
      choices: [
        'Si Satanas at ang kanyang mga anghel ay inihagis mula sa langit.',
        'Si Satanas ay may sungay, hati ang paa, at baak, at may buntot.',
        'Nahikayat ni Satanas ang ikatlong bahagi ng mga anghel sa langit na sumama sa kanya.',
        'Ibig ni Satanas na tulungan ang mga anak ni Jesus.'
      ]),
  Question(
    id: 'T3Q5',
    text:
        'Ipinangangako ng Nahum 1:9 na" ang #shortblank ay hindi na muling titindig na #shortblank .',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T3Q6',
    instructionText: 'Upang tapusin ang pangungusap na ito, piliin ang maling kataga.',
    text: 'Ang mga anghel ay:',
    type: QuestionType.falseMultiple,
    choices: [
      'espiritu ng mga batang namatay.',
      'mga ibang nilalang na nilikha ng Dios at may mataas na anyo ng pagkatao kaysa sa tao.',
      'mga anak ni Satanas',
      'mga multo',
      'mga lamang-lupa'
    ],
  ),
  Question(
    id: 'T3Q7',
    text: 'Piliin ang totoo o hindi totoo pagkatapos ng mga pangungusap na ito:',
    type: QuestionType.falseMultiple,
    choices: [
      'Ang mga anghel ay kasinliwanag ng kidlat',
      'Ang mga anghel ay hindi kumakain ng anuman',
      'Mayroong libu-libong mga anghel'
    ],
  ),
  Question(
    id: 'T3Q8',
    text: 'Bawat bata ay may bantay na #shortblank na nag-iingat sa kanya.',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T3Q9',
    text: 'Ang pinakapangunahing gawain ng mga anghel ay #longblank',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T3Q10',
    text: 'Ipinangako ng Awit 91 na "Siya\'y #shortblank sa kanyang #shortblank upang ingatan ka sa iyong mga lakad"',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T3Q11',
    text:
        'Alin ang higit na malakas ang mga anghel ni Satanas o ang mga anghel ni Jesus? #longblank',
    type: QuestionType.fillBlanks,
  ),
];