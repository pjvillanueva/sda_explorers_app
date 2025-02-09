import 'package:sda_explorers_app/utils/constants.dart';

class UserRole {
  final String id;
  final String userId;
  final String roleId;

  UserRole({required this.id, required this.userId, required this.roleId});

  Map<String, dynamic> toJson() =>
      {'id': id, 'userId': userId, 'roleId': roleId};

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole(
      id: json['id'],
      userId: json['userId'],
      roleId: json['roleId'],
    );
  }

  String get roleName {
    switch (roleId) {
      case OWNER_ROLE_ID:
        return 'Owner';
      case ADMIN_ROLE_ID:
        return 'Admin';
      case GUIDE_ROLE_ID:
        return 'Guide';
      case EXPLORER_ROLE_ID:
        return 'Explorer';
      default:
        return 'Guest';
    }
  }
}

get guestUserRole => UserRole(id: '', userId: '', roleId: '');

