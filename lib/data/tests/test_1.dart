import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test1Questions = [
  Question(
    id: 'T1Q1',
    text: 'Sa pagkakasaulo, isulat ang talatang sauhuluhin ng aralin ito:',
    type: QuestionType.freeText,
  ),
  Question(
    id: 'T1Q2',
    text:
        'Sinasabi ng Bibliya na sa pasimula ang sanlibutan ay nilalang sa pamamagitan ng: ',
    type: QuestionType.freeText,
  ),
  Question(
      id: 'T1Q3',
      text:
          'Ang tatlong Persona na magkakasamang nagsagawa ng kanilang gawain bilang ISANG DIOS ay ang: ',
      type: QuestionType.enumerate,
      answersNeeded: 3),
  Question(
    id: 'T1Q4',
    text:
        'Bago isinilang bilang sanggol si Jesus, Siya\'y naninirahan sa #shortblank at tumutulong din sa paglalang ng #shortblank .',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T1Q5',
    instructionText: 'Punan ang mga patlang ng kataga mula sa Awit 53:1:',
    text: '"Ang #shortblank ay nagsabi sa #shortblank" Walang #shortblank .',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T1Q6',
    text:
        'Ang mga punong kahoy at nga hayop ay unang nilalang sa pamamagitan ng:',
    type: QuestionType.choiceSingle,
    choices: ['Aksidente', 'Tao', 'Salita ng Dios', 'Kuryente', 'Ebolusyon'],
  ),
  Question(
    id: 'T1Q7',
    text:
        'Sang-ayon sa Genesis 1:27, kung hindi dahil sa kasalanan, ang tao ngayo\'y magiging katulad ng:',
    type: QuestionType.choiceSingle,
    choices: ['Isang unggoy', 'Dios', 'Isang ibon'],
  ),
  Question(
    id: 'T1Q8',
    text:
        'Sa pamamagitan ng #shortblank mauunawaan natin ang gawain ng paglalang. (Par. 11)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T1Q9',
    text:
        'Bukod sa paglalang sa sanlibutang ito at lahat ng narito ano pa ang nilalang ng Dios? (Par. 8)',
    type: QuestionType.freeText,
  ),
  Question(
    id: 'T1Q10',
    text:
        'Nang matapos ng Dios ang Kanyang paglalang sa sanlibutan, Siya\'y #shortblank ng ikapitong araw at #shortblank ang ikapitong araw at Kanyang #shortblank ; at ang lahat ng mga anak ng Dios ay #shortblank.',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T1Q11',
    text:
        'Ang kabataan ay dapat makinig sa Dios sapagkat sinasabi ng Ecclesiastes 12:1, "Alalahanin mo rin ang #shortblank sa mga kaarawan ng iyong #shortblank."',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T1Q12',
    text:
        'Yamang ang Dios ay siyang lumikha sa ating lahat, ang buong katungkulan natin ay ang #shortblank, at #shortblank ang Kanyang mga #shortblank',
    type: QuestionType.fillBlanks,
  ),
];
