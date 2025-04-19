
import 'package:sda_explorers_app/data/models/user.dart';

class Guide {
  final String id;
  final String userId;
  final User? user;
  final List<String> explorerIds;
  final List<User>? explorers;

  Guide({
    required this.id,
    required this.userId,
    this.user,
    required this.explorerIds,
    this.explorers,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'explorerIds': explorerIds,
      'explorers': explorers?.map((e) => e.toJson()).toList(),
    };
  }

  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
      id: json['id'] as String,
      userId: json['userId'] as String,
      explorerIds: List<String>.from(json['explorerIds']),
      explorers: (json['explorers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e))
          .toList(),
    );
  }

  @override
  String toString() =>
      'Guide: { id: $id, userId: $userId, explorerIds: $explorerIds, explorers: $explorers}';
}