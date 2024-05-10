import 'package:equatable/equatable.dart';

class Session extends Equatable {
  const Session({
    required this.id,
    required this.accountID,
    required this.userID,
    required this.expires,
    required this.permission,
  });

  final String id;
  final String accountID;
  final String userID;
  final int expires;
  final List? permission;

  @override
  List<Object?> get props => [id, accountID, userID, expires, permission];

  bool get hasExpired {
    if (expires == 0) {
      return true;
    }
    return DateTime.now().millisecondsSinceEpoch > expires;
  }

  Session.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        accountID = json['accountID'],
        userID = json['userID'],
        expires = json['expires'],
        permission = json['permissionLevel'];

  Map<String, dynamic> toJson() => {
        '_id': id,
        'accountID': accountID,
        'userID': userID,
        'expires': expires,
        'permissionLevel': permission
      };
}
