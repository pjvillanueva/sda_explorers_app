import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test10Questions = [
  Question(
    id: 'T10Q1',
    text: 'Napag-aralan mo ba ang talatang sauluhin ng 00 o HINDI',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T10Q2',
    text:
        'Anong dakilang katanungan ang itinatanong ng mga alagad kay Jesus? #longblank (Par. 1)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T10Q3',
    text:
        'Sinabi ni Jesus na magkakaroon ng maraming #shortblank habang nalalapit ang katapusan ng sanlibutan #shortblank (Par. 2)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T10Q4',
    text:
        'Sinasabi ni Pablo: "Pagka sinasabi ng mga tao #shortblank at #shortblank kung magkagayo\'y darating sa kanila ang #shortblank " (Par. 9)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T10Q5',
    text:
        'Mula sa panahon ni Daniel at patuloy, ilan ang magbabagong imperyo ng sanlibutan? #longblank (Par. 9)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T10Q6',
    text:
        'Isulat ninyo ang mga imperyong ito #shortblank , #shortblank , #shortblank , at #shortblank (Par. 9)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T10Q7',
    text:
        'Nalalaman natin na walang diktador ang nagtagumpay na mapaglalakip na muli ang Europa, sapagkat sinasabi ng Daniel 2:43 na:',
    type: QuestionType.freeText,
  ),
  Question(
    id: 'T10Q8',
    text:
        'Habang naglalaban ang mga kaharian ng Europa at nahahati, maglalagay ang #shortblank ng kanya #longblank (Par. 11)',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T10Q9',
    instructionText: 'PUSONG KATANUNGAN',
    text: 'Nananampalataya ka bang napakalapit na ang pagparito ni Jesus?',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T10Q10',
    instructionText: 'PUSONG KATANUNGAN',
    text:
        'Nagpasya ka na bang sundin si Jesus habang daan at maging handa sa Kanyang pagparito?',
    type: QuestionType.trueOrFalse,
  ),
];