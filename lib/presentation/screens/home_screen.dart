import 'package:flutter/material.dart';
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
import 'package:sda_explorers_app/presentation/screens/input_screen.dart';
import 'package:sda_explorers_app/presentation/theme/app_colors.dart';
import 'package:sda_explorers_app/presentation/widgets/lesson_list_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(229, 172, 63, 1),
            title: const Text('Explorers',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            actions: [
              IconButton(
                  icon: const Icon(Icons.input),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InputPage()));
                  })
            ]),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: LIGHT_BACKGROUND_COLOR,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('L E S S O N S',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                         Divider(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: lessons.length,
                        itemBuilder: (context, index) => LessonListTile(
                            number: index + 1, content: lessons[index]),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10)),
                  )
                ]))));
  }
}
