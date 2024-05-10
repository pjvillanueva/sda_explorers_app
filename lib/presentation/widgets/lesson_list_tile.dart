import 'package:flutter/material.dart';
import '../screens/lesson_screen.dart';

class LessonListTile extends StatelessWidget {
  const LessonListTile(
      {super.key, required this.number, required this.content});

  final int number;
  final Map<String, String> content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(10),
        tileColor: const Color.fromARGB(255, 164, 201, 220),
        shape: const RoundedRectangleBorder(),
        leading: const Icon(Icons.book_outlined),
        title: Text('Lesson $number',
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        subtitle: Text(content.values.toList().first,
            style:
                const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic)),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LessonScreen(
                    lessonContents: content, lessonNumber: number))));
  }
}
