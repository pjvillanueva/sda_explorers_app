import 'package:sda_explorers_app/data/models/user.dart';

abstract class BaseRole {
  final String id;
  final String userId;
  final User? user;

  const BaseRole({
    required this.id,
    required this.userId,
    this.user,
  });
}
