import 'package:flutter/material.dart';
import 'package:sda_explorers_app/data/lessons/helpers.dart';
import 'package:sda_explorers_app/presentation/custom%20widgets/snackbar.dart';
import '../screens/lesson_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LessonListTile extends StatelessWidget {
  const LessonListTile(
      {super.key,
      required this.index,
      required this.content,
      this.isAllowed = false});

  final int index;
  final Map<String, String> content;
  final bool isAllowed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 2,
      color: isAllowed ? null : Colors.grey[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: isAllowed ? Colors.blue[700] : Colors.grey,
          child: isAllowed? Text(
            intToRoman(index + 1),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
          ) :  const Icon(Icons.lock, color: Colors.white, size: 16),
        ),
        title: Text(
          '${AppLocalizations.of(context)!.homeLesson} ${index + 1}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          content.values.first,
          style: TextStyle(color: isAllowed? Colors.grey[600] : Colors.grey[800]),
        ),
        trailing: isAllowed ? const Icon(Icons.arrow_forward_ios, size: 16) : null,
        onTap: isAllowed
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LessonScreen(
                            lessonContents: content, lessonNumber: index + 1)));
              }
            : () {
                AppSnackBar.show(context,
                    message:
                        'Oops. Lesson is not yet available. Ask your Guide for access',
                    type: SBMessageType.info);
              },
      ),
    );
  }
}
