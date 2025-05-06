import 'package:sda_explorers_app/data/models/answer.dart';
import 'package:sda_explorers_app/data/models/user.dart';

class Explorer {
  final String id;
  final String userId;
  User? user;
  String? guideId;
  List<String> allowedLessons;
  List<LessonAnswer> lessonAnswers;
  bool? isGraduated;

  Explorer({
    required this.id,
    required this.userId,
    this.user,
    this.guideId,
    required this.allowedLessons,
    required this.lessonAnswers,
    this.isGraduated,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'guideId': guideId,
      'allowedLessons': allowedLessons,
      'lessonAnswers': lessonAnswers.map((e) => e.toJson()).toList(),
      'isGraduated': isGraduated,
    };
  }

  factory Explorer.fromJson(Map<String, dynamic> json) {
    return Explorer(
      id: json['id'] as String,
      userId: json['userId'] as String,
      guideId: json['guideId'] as String?,
      allowedLessons: List<String>.from(json['allowedLessons']),
      lessonAnswers: (json['lessonAnswers'] as List<dynamic>?)
          ?.map((e) => LessonAnswer.fromJson(e))
          .toList() ??
          [],
      isGraduated: json['isGraduated'] as bool?,
    );
  }

  @override
  String toString() =>
      'Explorer: { id: $id, userId: $userId, guideId: $guideId, allowedLessons: $allowedLessons, lessonAnswers: $lessonAnswers, isGraduated: $isGraduated}';
}