import 'package:flutter/material.dart';
import 'package:sda_explorers_app/presentation/widgets/text_styles.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen(
      {super.key, required this.lessonNumber, required this.lessonContents});

  final int lessonNumber;
  final Map<String, String> lessonContents;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
        appBar: AppBar(
            title: Text('Lesson $lessonNumber'),
            backgroundColor: const Color.fromRGBO(229, 172, 63, 1)),
        body: Scrollbar(
            controller: scrollController,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: ListView.separated(
                    controller: scrollController,
                    itemCount: lessonContents.length,
                    itemBuilder: (context, index) {
                      final key = lessonContents.keys.elementAt(index);
                      final value = lessonContents[key] ?? '';
                      return GestureDetector(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(value, style: getTextStyle(key))),
                          onTap: () {});
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10.0)))));
  }
}

TextStyle? getTextStyle(String key) {
  var textType = key[2];
  switch (textType) {
    case 'T':
      return TITLE_STYLE;
    case 'M':
      return MEMORY_VERSE_STYLE;
    case 'P':
      return PARAGRAPH_STYLE;
    case 'S':
      return SUBTITLE_TYPE;
    case 'Q':
      return QUESTION_TYPE;
    case 'B':
      return BIBLE_VERSE_TYPE;
    case 'I':
      return INDEX_STYLE;
  }
  return null;
}
