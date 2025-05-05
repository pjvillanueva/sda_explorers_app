import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sda_explorers_app/data/models/explorer.dart';
import 'package:sda_explorers_app/data/models/guide.dart';
import 'package:sda_explorers_app/data/models/user.dart';
import 'package:sda_explorers_app/data/models/user_roles.dart';

class UserState {
  UserState({required this.user, required this.role, this.roleData});

  final User? user;
  final UserRole role;
  final dynamic roleData;

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'role': role.toJson(),
        'roleData': roleData,
      };

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      role: UserRole.fromJson(json['role']),
      roleData: json['roleData'],
    );
  }

  UserState copyWith(
      {User? user, UserRole? role, dynamic roleData, bool clearUser = false}) {
    return UserState(
      user: clearUser ? null : user ?? this.user,
      role: role ?? this.role,
      roleData: roleData ?? this.roleData,
    );
  }

  @override
  String toString() => 'user: $user role: $role roleData: $roleData';

  User? get getUser => user;
  UserRole get getRole => role;
  dynamic get getRoleData {
    if (role.roleName == "Guide") {
      return roleData as Guide;
    }
    if (role.roleName == "Explorer") {
      return roleData as Explorer;
    }
    return roleData;
  }
}

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(UserState(user: null, role: guestUserRole));

  // Update the user state
  void updateUser(User user) {
    emit(state.copyWith(user: user));
  }

  // Update user role
  void updateRole(UserRole role) {
    emit(state.copyWith(role: role));
  }

  // Clear the user state
  void clearUser() {
    emit(state.copyWith(clearUser: true, role: guestUserRole));
  }

  @override
  UserState fromJson(Map<String, dynamic> json) {
    return UserState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    // Optionally skip saving null user to disk
    return state.toJson();
  }
}
