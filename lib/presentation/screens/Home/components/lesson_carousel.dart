import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sda_explorers_app/data/lessons/lesson_1.dart';
import 'package:sda_explorers_app/data/lessons/lesson_10.dart';
import 'package:sda_explorers_app/data/lessons/lesson_11.dart';
import 'package:sda_explorers_app/data/lessons/lesson_12.dart';
import 'package:sda_explorers_app/data/lessons/lesson_13.dart';
import 'package:sda_explorers_app/data/lessons/lesson_14.dart';
import 'package:sda_explorers_app/data/lessons/lesson_15.dart';
import 'package:sda_explorers_app/data/lessons/lesson_16.dart';
import 'package:sda_explorers_app/data/lessons/lesson_17.dart';
import 'package:sda_explorers_app/data/lessons/lesson_18.dart';
import 'package:sda_explorers_app/data/lessons/lesson_19.dart';
import 'package:sda_explorers_app/data/lessons/lesson_2.dart';
import 'package:sda_explorers_app/data/lessons/lesson_20.dart';
import 'package:sda_explorers_app/data/lessons/lesson_21.dart';
import 'package:sda_explorers_app/data/lessons/lesson_22.dart';
import 'package:sda_explorers_app/data/lessons/lesson_23.dart';
import 'package:sda_explorers_app/data/lessons/lesson_24.dart';
import 'package:sda_explorers_app/data/lessons/lesson_3.dart';
import 'package:sda_explorers_app/data/lessons/lesson_4.dart';
import 'package:sda_explorers_app/data/lessons/lesson_5.dart';
import 'package:sda_explorers_app/data/lessons/lesson_6.dart';
import 'package:sda_explorers_app/data/lessons/lesson_7.dart';
import 'package:sda_explorers_app/data/lessons/lesson_8.dart';
import 'package:sda_explorers_app/data/lessons/lesson_9.dart';
import 'package:sda_explorers_app/presentation/screens/Home/components/home_bar.dart';
import 'package:sda_explorers_app/utils/constants.dart';

class LessonCarousel extends StatelessWidget {
  // final List<String> lessons =
  //     List.generate(24, (index) => 'Lesson ${index + 1}');

  LessonCarousel({super.key});

  final lessons = [
    Lesson1ContentsMap,
    Lesson2ContentsMap,
    Lesson3ContentsMap,
    Lesson4ContentsMap,
    Lesson5ContentsMap,
    Lesson6ContentsMap,
    Lesson7ContentsMap,
    Lesson8ContentsMap,
    Lesson9ContentsMap,
    Lesson10ContentsMap,
    Lesson11ContentsMap,
    Lesson12ContentsMap,
    Lesson13ContentsMap,
    Lesson14ContentsMap,
    Lesson15ContentsMap,
    Lesson16ContentsMap,
    Lesson17ContentsMap,
    Lesson18ContentsMap,
    Lesson19ContentsMap,
    Lesson20ContentsMap,
    Lesson21ContentsMap,
    Lesson22ContentsMap,
    Lesson23ContentsMap,
    Lesson24ContentsMap
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lessons',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
            height: 350,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return LessonCard(
                    lessonNumber: index + 1,
                    lessonContent: lessons[index],
                    progress: 0.75,
                    testResult: '7/10');
              },
            )),
      ],
    );
  }
}

class LessonCard extends StatelessWidget {
  final int lessonNumber;
  final Map<String, String> lessonContent;
  final double progress;
  final String testResult;

  const LessonCard({
    super.key,
    required this.lessonNumber,
    required this.lessonContent,
    required this.progress,
    required this.testResult,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/images/explorer_splash.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: Text(
                        '$lessonNumber',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          color: Colors.white),
                      child: Row(children: [
                        const GoldCoin(size: 22),
                        const SizedBox(width: 5),
                        Text('500',
                            style: GoogleFonts.roboto(
                                fontSize: 16, color: Colors.black))
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Center(
                    child: Text(
                      lessonContent.values.first,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 2),
                            blurRadius: 5,
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress',
                      style: GoogleFonts.roboto(
                          fontSize: 14, color: darkTextColor),
                    ),
                    Text(
                      '${(progress * 100).round()}% completed',
                      style: GoogleFonts.roboto(
                        fontSize: 10,
                        color: darkTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: Colors.grey[300],
                  color: Colors.orange,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Take Test',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: darkTextColor,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.blue)),
                      onPressed: () {},
                      child: Text('Test $lessonNumber',
                          style: const TextStyle(
                            color: Colors.white,
                          )),
                    )
                    // Text(
                    //   testResult,
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.bold,
                    //     color: testResult == 'Passed'
                    //         ? Colors.green
                    //         : Theme.of(context).colorScheme.error,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
