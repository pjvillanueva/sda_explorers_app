import 'package:flutter/material.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/buttons/navigate_to_test_button.dart';
import 'package:sda_explorers_app/presentation/widgets/lesson_texts.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen(
      {super.key, required this.lessonNumber, required this.lessonContents});

  final int lessonNumber;
  final Map<String, String> lessonContents;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    // Determine the index of the first "P" type
    int firstParagraphIndex =
        lessonContents.keys.toList().indexWhere((key) => key[2] == 'P');

    return Scaffold(
        appBar: AppBar(
            title: Text('Lesson $lessonNumber'),
            backgroundColor: const Color.fromRGBO(229, 172, 63, 1)),
        body: Scrollbar(
            controller: scrollController,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                    controller: scrollController,
                    itemCount: lessonContents.length,
                    itemBuilder: (context, index) {
                      final key = lessonContents.keys.elementAt(index);
                      final value = lessonContents[key] ?? '';
                      bool isFirstParagraph = index == firstParagraphIndex;
                      return getTextContainer(key, value, isFirstParagraph);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10.0)))));
  }
}

Widget? getTextContainer(String key, String value, bool isFirst) {
  var textType = key[2];

  switch (textType) {
    case 'T':
      return LessonTitle(value, key);
    case 'M':
      return MemoryVerse(value, key);
    case 'P':
      return Paragraph(value, key, isFirst: isFirst);
    case 'S':
      return Subtitle(value, key);
    case 'Q':
      return Question(value, key);
    case 'B':
      return BibleVerse(value, key);
    case 'I':
      return Index(value, key);
    case 'N':
      return const NavigateToTest(testNumber: 1, testContents: {});
    case 'V':
      return ImageContainer(value);
  }
  return null;
}
