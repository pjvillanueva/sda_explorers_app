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
import 'package:sda_explorers_app/presentation/screens/Home/components/app_drawer.dart';
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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.primary,
      endDrawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Image.asset('assets/logos/explorers_logo12_nbg.png'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu,
                color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {
              if (scaffoldKey.currentState?.isDrawerOpen == false) {
                scaffoldKey.currentState?.openEndDrawer();
              } else {
                scaffoldKey.currentState?.closeEndDrawer();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[400]!, Colors.blue[600]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome, Explorer!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ready to embark on your Bible quiz journey?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Column(
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
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: lessons.length,
                        itemBuilder: (context, index) {
                          return LessonListTile(
                              index: index, content: lessons[index]);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
