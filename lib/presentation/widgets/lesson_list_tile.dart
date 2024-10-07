import 'package:flutter/material.dart';
import '../screens/lesson_screen.dart';

class LessonListTile extends StatelessWidget {
  const LessonListTile({super.key, required this.index, required this.content});

  final int index;
  final Map<String, String> content;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[700],
          child: Text(
            '${index + 1}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          'Lesson ${index + 1}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          content.values.first,
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to lesson screen
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LessonScreen(
                      lessonContents: content, lessonNumber: index + 1)));
        },
      ),
    );
  }
}
