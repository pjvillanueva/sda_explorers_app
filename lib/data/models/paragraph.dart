// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:equatable/equatable.dart';

// Paragraph {
// 	_id: String,
// 	lessonID: String,
// 	lessonNumber: int,
// 	index: int,
// 	type: ParagraphType,
// 	content: String,
// 	style: TextStyle,
// }

enum ParagraphType { title, subtitle, bibleVerse, content }

class Paragraph extends Equatable {
  Paragraph({
    required this.id,
    required this.lessonID,
    required this.lessonNumber,
    required this.index,
    required this.type,
    required this.content,
    required this.style,
  });

  final String id;
  final String lessonID;
  final int lessonNumber;
  final int index;
  final ParagraphType type;
  final String content;
  final String style;

  @override
  List<Object?> get props =>
      [id, lessonID, lessonNumber, index, type, content, style];

  @override
  String toString() =>
      'Paragraph : (id: $id, lessonID: $lessonID, lessonNumber: $lessonNumber, index: $index, type: $type, content: $content, style: $style)';

  Paragraph.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        lessonID = json['lessonID'],
        lessonNumber = json['lessonNumber'],
        index = json['index'],
        type = json['type'],
        content = json['content'],
        style = json['style'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'lessonID': lessonID,
        'lessonNumber': lessonNumber,
        'index': index,
        'type': type,
        'content': content,
        'style': style,
      };
}
