import 'package:flutter/material.dart';
import 'package:sda_explorers_app/data/lessons/lesson_1.dart';
import 'package:sda_explorers_app/data/lessons/lesson_2.dart';
import 'package:sda_explorers_app/data/lessons/lesson_3.dart';
import 'package:sda_explorers_app/data/lessons/lesson_4.dart';
import 'package:sda_explorers_app/presentation/screens/input_screen.dart';
import 'package:sda_explorers_app/presentation/widgets/lesson_list_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final lessons = [
    Lesson1ContentsMap,
    Lesson2ContentsMap,
    Lesson3ContentsMap,
    Lesson4ContentsMap
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
            padding: const EdgeInsets.all(30.0),
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text('L E S S O N S',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  const Divider(),
                  ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: lessons.length,
                      itemBuilder: (context, index) => LessonListTile(
                          number: index + 1, content: lessons[index]),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10))
                ]))));
  }
}
