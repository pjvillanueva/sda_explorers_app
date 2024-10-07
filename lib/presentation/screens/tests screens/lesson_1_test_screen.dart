import 'package:flutter/material.dart';

class Lesson1TestScreen extends StatefulWidget {
  const Lesson1TestScreen({super.key});

  @override
  _Lesson1TestScreenState createState() => _Lesson1TestScreenState();
}

class _Lesson1TestScreenState extends State<Lesson1TestScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 1 Test'),
        backgroundColor: const Color.fromRGBO(229, 172, 63, 1),
      ),
      body: Scrollbar(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //1
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text:
                          '1. Ang tatlong Persona na magkakasamang nagsagawa ng kanilang gawain bilang ISANG DIOS ay ang'),
                  WidgetSpan(child: SizedBox(width: 150, child: TextField())),
                  WidgetSpan(child: TextField()),
                  TextSpan(text: ' at '),
                  WidgetSpan(child: TextField()),
                ]
                        // text: '1. Ang tatlong Persona na magkakasamang nagsagawa ng kanilang gawain bilang ISANG DIOS ay ang',
                        )),
                // QuestionWithBlanks(
                //     question: '1. Ang tatlong Persona na magkakasamang nagsagawa ng kanilang gawain bilang ISANG DIOS ay ang (1) #shortblank (2) #shortblank at (3) #shortblank', onAnswersChanged: updateAnswers)
                // buildTextWithInputs('Sa pagkakasaulo, isulat ang talatang sauhuluhin ng aralin ito #longblank'),
                // SizedBox(height: 10),
                // buildTextWithInputs('Sinasabi ng Bibliya na sa pasimula ang sanlibutan ay nilalang sa pamamagitan ng #longblank'),
                // SizedBox(height: 10),
                // buildTextWithInputs('Ang tatlong Persona na magkakasamang nagsagawa ng kanilang gawain bilang ISANG DIOS ay ang (1) #shortblank (2) #shortblank at (3) #shortblank'),
                // Add the rest of your text items here, wrapped in buildTextWithInputs()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
