// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_1.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_10.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_11.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_12.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_13.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_14.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_15.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_16.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_17.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_18.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_19.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_2.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_20.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_21.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_22.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_23.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_24.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_3.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_4.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_5.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_6.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_7.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_8.dart';
import 'package:sda_explorers_app/data/en_lessons/en_lesson_9.dart';
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

const TextTheme TEXT_THEME_DEFAULT = TextTheme(
    // headline1: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
    // headline2: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
    // headline3: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    // headline4: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    // headline5: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
    // headline6: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
    // bodyText1:
    //     TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.5),
    // bodyText2:
    //     TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.5),
    // subtitle1: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    // subtitle2: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)
    );

const TextTheme TEXT_THEME_SMALL = TextTheme(
    // headline1: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
    // headline2: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    // headline3: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
    // headline4: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
    // headline5: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
    // headline6: TextStyle(fontWeight: FontWeight.w700, fontSize: 10),
    // bodyText1:
    //     TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.5),
    // bodyText2:
    //     TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.5),
    // subtitle1: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    // subtitle2: TextStyle(fontSize: 10, fontWeight: FontWeight.w400)
    );

const darkTextColor = Color(0xFF00072D);



  final FIL_LESSONS = [
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

  final EN_LESSONS = [
    Lesson1ContentsMap_EN,
    Lesson2ContentsMap_EN,
    Lesson3ContentsMap_EN,
    Lesson4ContentsMap_EN,
    Lesson5ContentsMap_EN,
    Lesson6ContentsMap_EN,
    Lesson7ContentsMap_EN,
    Lesson8ContentsMap_EN,
    Lesson9ContentsMap_EN,
    Lesson10ContentsMap_EN,
    Lesson11ContentsMap_EN,
    Lesson12ContentsMap_EN,
    Lesson13ContentsMap_EN,
    Lesson14ContentsMap_EN,
    Lesson15ContentsMap_EN,
    Lesson16ContentsMap_EN,
    Lesson17ContentsMap_EN,
    Lesson18ContentsMap_EN,
    Lesson19ContentsMap_EN,
    Lesson20ContentsMap_EN,
    Lesson21ContentsMap_EN,
    Lesson22ContentsMap_EN,
    Lesson23ContentsMap_EN,
    Lesson24ContentsMap_EN
  ];

