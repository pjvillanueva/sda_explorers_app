// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  Lesson({
    required this.id,
    required this.lessonNumber,
    required this.title,
    required this.memoryVerse,
    required this.content,
  });

  final String id;
  final int lessonNumber;
  final String title;
  final String memoryVerse;
  final List content;

  @override
  List<Object?> get props => [id, lessonNumber, title, memoryVerse, content];

  @override
  String toString() =>
      'Lesson : (id: $id, lessonNumber: $lessonNumber, title: $title, memoryVerse: $memoryVerse, content: $content)';

  Lesson.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        lessonNumber = json['lessonNumber'],
        title = json['title'],
        memoryVerse = json['memoryVerse'],
        content = json['content'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'lessonNumber': lessonNumber,
        'title': title,
        'memoryVerse': memoryVerse,
        'content': content
      };
}
