

import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test4Questions = [
  Question(
    id: 'T4Q1',
    text: 'Natutunan na ba ninyo ang talatang-sauluhin?',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T4Q2',
    text: 'Sang-ayon sa ating saulihin, kung ibig ng tao na maligtas, dapat siyang manampalataya sa #shortblank na anak ng #shortblank .',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T4Q3',
    text: 'Ang unang lalaki at unang babae ay pinangalanang #shortblank at #shortblank , at ang kanilang unang tahanan ay tinatawag na Halamanan ng #shortblank . (Par. 3, 4)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T4Q4',
    text: 'Lagyan ng guhit na krus ang maling pangungusap sa sumusunod:',
    type: QuestionType.falseMultiple,
    choices: [
      'Sa simula ay tunay na maligaya si Adan at Eba sa kanilang tahanan.',
      'Naghari ang Dios kay Adan at Eba ngunit ang mga hayop ay dapat sumusunod sa tao.',
      'Ginawa si Eba mula sa isang tadyang ni Adan.',
      'Si Adan ay ginawa mula sa kahoy.',
    ],
  ),
  Question(
    id: 'T4Q5',
    text: 'Pinagbawalan si Adan at Eba na kumain ng bunga ng punong kahoy ng #shortblank ng #shortblank at #shortblank . (Par. 5)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T4Q6',
    text: 'Si Eba ay nadaya ng #shortblank na nagsalita sa kanya. Yao\'y tunay na si #shortblank na nagsalita sa pamamagitan ng #shortblank . (Par. 6, 7)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T4Q7',
    text: 'Sinabi ng ahas kay Eba na siya\'y hindi #shortblank kung kakainin niya ang pinagbabawal na bunga, at siya ay magiging tulad ng #shortblank kung kakainin ito. (Par. 6)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T4Q8',
    text: 'Lagyan ng bilog na guhit ang wastong tugon: Matapos magkasala ni Adan at Eba, sinabi ng Dios na Kanyang:',
    type: QuestionType.falseMultiple,
    choices: [
      'Lililpulin sila karakaraka.',
      'Magpapadala ng isang Tagapagligtas.',
      'Lilipuling karakaraka si Satanas.',
    ],
  ),
  Question(
    id: 'T4Q9',
    text: 'Sinabi ng anghel ang tungkol sa Tagapagligtas, "At ang pangalang itatawag mo sa Kanya ay #shortblank sapagkat #shortblank niya sila mula sa kanilang mga #shortblank (Par. 9)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T4Q10',
    text: 'Ang pangalan "Jesus" ay nangangahulugang #shortblank ang pangalan ng kanyang ina ay #shortblank, at ang Kanyang Amang sumasalangit ay #shortblank (Par. 9)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T4Q11',
    text: 'Bumanggit ng tatlong mga malulupit na bagay na ginawa nila kay Jesus sa katapusan ng Kanyang paglilingkod;',
    answersNeeded: 3,
    type: QuestionType.enumerate,
  ),
  Question(
    id: 'T4Q12',
    text: 'Tandaan ang maling pangungusap sa sumusunod:',
    type: QuestionType.falseMultiple,
    choices: [
      'Si Jesus ay nasa Kanyang libingan pa.',
      'Si Jesus ay nasa Langit na ngayon.',
      'Nasasabik si Jesus na patawarin ang inyong mga kasalanan.',
      'Muling paririto si Jesus upang dalhin sa langit ang Kanyang tagasunod.',
    ],
  ),
];