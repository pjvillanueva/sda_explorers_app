import 'package:sda_explorers_app/data/models/question.dart';

List<Question> test6Questions = [
  Question(
    id: 'T6Q1',
    text:
        'Natutunan na ba ninyo ang talatang sauluhin sa araling ito? Sagutin ng OO o HINDI',
    type: QuestionType.trueOrFalse,
  ),
  Question(
    id: 'T6Q2',
    text:
        'Ang dalawang unang anak na lalaki ni Adan at Eba ay pinangalanang #shortblank at #shortblank Ang ilan sa kanilang mga lahi ay nabubuhay hanggang #shortblank taon.',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T6Q3',
    text:
        'Sinabihan ng Dios si Noe na magtayo ng malaking #shortblank. sapagkat lilipulin niya ang lupa sa pamamagitan ng #shortblank. Bukod sa ilang hayop, #shortblank tao lamang ang naligtas.',
    type: QuestionType.fillBlanks,
  ),
  Question(
      id: 'T6Q4',
      text: 'Bilugan ang tumpak na pangungusap sa mga sumusunod:',
      type: QuestionType.falseMultiple,
      choices: [
        'a. Tinawag ng Dios si Abraham sapagkat siya\'y mayaman.',
        'b. Tinawag ng Dios si Abraham sapagkat siya\'y nahahandang sumunod.',
        'c. Si Isaac ay hindi sumusunod sa Dios.',
        'd. Si Jacob ay may labindalawang anak na lalaki.',
      ]),
  Question(
    id: 'T6Q5',
    text:
        'Sinabihan ng Dios si Moses na pangunahan ang Israel paglabas ng #shortblank sa ilang at sa dakong huli\'y sa #shortblank, sa daan, sila\'y tumigil sa Bundok ng #shortblank na doo\'y ibinigay ng Dios ang SAMPUNG #shortblank na isinulat sa mga tapyas ng #shortblank.',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T6Q6',
    text:
        'Ang ikalawang Hari ng Israel ay tinatawag na #shortblank. Sa dakong huli, ang bayan ng Dios ay tumigil sa pagsunod sa #shortblank ng Dios kaya\'t sila\'y pinahintulutan ng Panginoon na madala sa #shortblank sa Babiloniya.',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T6Q7',
    text:
        'Halos pagkatapos ng 600 taon ay ipinanganak si #shortblank sa #shortblank. Siya\'y ipinako ng masamang tao sa #shortblank.',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T6Q8',
    text:
        'Ang isa sa nagkaroon ng bahagi sa pagbato kay Esteban ay pinangalanang #shortblank . Sa dakong huli, siya ay naging isang misyonero sa #shortblank .',
    type: QuestionType.freeText,
  ),
  Question(
      id: 'T6Q9',
      text: 'Lagyan ng tanda ang maling pangungusap sa sumusunod:',
      type: QuestionType.falseMultiple,
      choices: [
        'a. Si Jesus ay may labing-apat na alagad.',
        'b. Ang mga alagad ay magiging mga pangulo sa unang Iglesya.',
        'c. Si Judas ay isang alagad at ipinagkanulo si Jesus.',
        'd. Ang lahat ng mga alagad ay pinatay bilang mga bayani.',
      ]),
  Question(
    id: 'T6Q10',
    text:
        'Sa loob ng maraming taon, ang iglesya ay sumulong sa kapangyarihan, at ilan sa matataas na opisyal ng pamahalaan ang umanib sa iglesya. Maraming bulaang #shortblank ang nagsimulang pumasok sa iglesya. Sa wakas, ang iglesya ay nagpakalayu-layo sa kasalanan, na anupa\'t inusig ang tunay na #shortblank .',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T6Q11',
    text:
        'Ang pagbabagong tatag ay nangangahulugan ng #shortblank . Ang pagbabagong tatag ay nagsimula nang may #shortblank daan-daang taon.',
    type: QuestionType.fillBlanks,
  ),
  Question(
    id: 'T6Q12',
    text:
        'Ang sanlibutan Kristiyano ay tumitingin ngayon sa hinaharap, sa dumarating na kaharian ni #shortblank .',
    type: QuestionType.fillBlanks,
  ),
];