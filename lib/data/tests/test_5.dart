import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test5Questions = [
  Question(
    id: 'T5Q1',
    text: 'Natutunan na ba ninyo ang talatang sauluhin sa araling ito? Sagutin ng 00 o HINDI',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T5Q2',
    text:
        'Natutunan na ba ninyo ang Panalangin ng Panginoon (Ama Namin) (Par. 10)? Sagutin ng OO o HINDI',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T5Q3',
    text: 'Ano ang unang pangangailangan ng isang ibig na makasumpong ng kaligtasan? #shortblank (Par. 1)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T5Q4',
    text: 'Sang-ayon sa Gawa 16:31, ano ang kailangang gawin upang maligtas? #shortblank (Par. 2)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T5Q5',
    text: 'Sinasabi ni Pedro sa Gawa 3:19 na ang sumusunod na hakbang upang maligtas ay: #shortblank (Par. 3)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T5Q6',
    text: 'Ang susunod na hakbang patungo sa kaligtasan ay #longblank (Par. 4)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T5Q7',
    text: 'Kung nagkasala tayo kanino man, dapat nating; (Lagyan ng krus ng guhit ang hindi wastong pangungusap:',
    type: QuestionType.falseMultiple,
    choices: [
      'Sabihin yaon sa lahat.',
      'Hilingin sa Dios na tayo\'y patawarin.',
      'Hilingin sa tao na tayo\'y patawarin.',
      'Sikapin lamang na limutin ang lahat ng tungkol dito.',
    ],
  ),
  Question(
    id: 'T5Q8',
    text: 'Malalaman nating pinatawad na ang ating mga kasalanan kung tayo\'y magsisisi;',
    type: QuestionType.falseMultiple,
    choices: [
      'Sapagkat gayon ang sinabi ng tao.',
      'Sapagkat nangako si Jesus; at tayo\'y may pananampalataya sa Kanyang Salita at nananampalataya sa Kanya.',
      'Sapagkat nararamdaman natin na tayo\'y pinatawad.',
    ]
  ),
  Question(
    id: 'T5Q9',
    text: 'Ipinangako ng Juan 6:37 na "Ang #shortblank sa akin sa anumang paraan ay #shortblank ko itataboy". (Par. 7)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T5Q10',
    text: 'Sang-ayon sa 1 Juan 2:3, nakikilala natin Siya kung #shortblank natin ang mga utos, at sang-ayon sa talatang 6 ay "nararapat din namang lumakad #shortblank ng inilakad niya (Par. 8)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T5Q11',
    text: 'Tandaan kung alin sa mga sumusunod na pangungusap ang totoo at alin ang hindi totoo sa paglalagay ng guhit na pabilog sa "totoo" o "hindi totoo."',
    type: QuestionType.falseMultiple,
    choices: [
      'Malalaman natin ang matuwid sa pamamagitan ng sinasabi sa atin ng tao.',
      'Ang Bibliya lamang ang tiyak na patnubay sa katuwiran.',
      'Ibig ng ilang tao na maligtas ngunit ayaw silang iligtas ni Jesus.',
      'Parurusahan ni Jesus ang isang tao sa kanyang nagawa, maging ang taong yaon ay wala nang nalalaman pang mabuting gawin.',
      'Ang panalangin ay pakikipag-usap kay Jesus at ang bawat isa\'y dapat manalangin araw-araw.',
    ],
  ),
];