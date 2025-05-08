import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test9Questions = [
  Question(
    id: 'T9Q1',
    text: 'Natutuhan ba ninyo ang talatang sauluhin? Sagutin ng OO o Hindi',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T9Q2',
    text: 'Ano ang higit na kinakatakutan at babahagyang nauunawaan kaysa alin mang bagay? #shortblank',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T9Q3',
    text: 'Sinasabi ni Jesus na ang mga patay ay nasa kanilang #shortblank pa rin. (Par. 2)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T9Q4',
    text: 'Sinasabi ni Job: "Ngunit talastas ko na #longblank ay #shortblank buhay at siya\'y #shortblank sa #shortblank sa #shortblank " Sinasabi rin niya na " #shortblank sa aking #shortblank " (Par. 3)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T9Q5',
    text: 'Lagyan ng guhit ng krus ang maling pangungusap sa sumusunod: (Par. 4, 5)',
    type: QuestionType.falseMultiple,
    choices: [
      'Pinupuri ngayon ng patay ang Panginoon',
      'Ang mga patay ay wala pa sa langit',
      'Nagtungo si David sa langit nang siya\'y mamatay'
    ]
  ),
  Question(
    id: 'T9Q6',
    text: 'Sinabi ng Awit 146:4 na "ang #longblank ay pumapanaw, siya\'y nanunumbalik kanyang #shortblank ; sa #shortblank ay #shortblank ang kanyang #shortblank " (Par. 6)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T9Q7',
    text: 'Sinasabi ng Ecclesiastes 9 (Par. 6) na walang anumang kaalaman o karunungan sa #shortblank at sinasabi sa atin ng Ecclesiastes 9:5 na "Sapagkat nalalaman ng mga #shortblank na sila\'y mangangamatay; ngunit hindi #shortblank ng patay ang #shortblank " ',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T9Q8',
    text: 'Inihalintulad ni Jesus ang kamatayan sa #shortblank na walang panaginip. (Par. 7) Kung ang isa\'y magising sa umaga, wari bang siya\'y natulog ng #shortblank lamang.',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T9Q9',
    text: 'Kung ang tao\'y nawalan nang malay, gaano ang kanyang nalalaman? #shortblank Kung ang tao\'y mamamatay, gaano ang kanyang nalalaman? #shortblank (Par. 8)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T9Q10',
    text: 'Sa kapanahunan ng Biblia, sinabihan ng Dios ang Kanyang bayan na ang isang nagpapanggap na nakakausap niya ang patay ay #shortblank (Par. 9)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T9Q11', 
    text: 'Yamang si Kristo ang may hawak ng tanging susi ng libingan, sino ang dapat nating sundin? #shortblank (Par. 10)', 
    type: QuestionType.fillBlanks)
];