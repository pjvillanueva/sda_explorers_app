import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sda_explorers_app/data/models/user.dart';
import 'package:sda_explorers_app/data/models/user_roles.dart';

class UserState {
  UserState({required this.user, required this.role});
  final User? user;
  final UserRole role;

  Map<String, dynamic> toJson() =>
      {'user': user?.toJson(), 'role': role.toJson()};

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      role: UserRole.fromJson(json['role']),
    );
  }

  UserState copyWith({User? user, UserRole? role}) {
    return UserState(
      user: user ?? this.user,
      role: role ?? this.role,
    );
  }

  @override
  String toString() => 'user: $user role: $role';

  User? get getUser => user;
  UserRole get getRole => role;
}

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(UserState(user: null, role: guestUserRole));

  // Update the user state
  void updateUser(User user) {
    emit(state.copyWith(user: user));
  }

  //Update user role
  void updateRole(UserRole role) {
    emit(state.copyWith(role: role));
  }

  // Clear the user state
  void clearUser() {
    emit(state.copyWith(user: null, role: guestUserRole));
  }

  @override
  UserState fromJson(Map<String, dynamic> json) {
    return UserState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(UserState state) {
    return state.toJson();
  }
}
