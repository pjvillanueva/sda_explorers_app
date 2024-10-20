import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sda_explorers_app/data/models/user.dart';

class UserState {
  UserState({required this.user});
  final User? user;

  Map<String, dynamic> toJson() => {'user': user?.toJson()};

  UserState.fromJson(Map<String, dynamic> json)
      : user = User.fromJson(json['user']);

  @override
  String toString() => 'user: $user';

  User? get getUser => user;
}

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(UserState(user: null));

  // Update the user state
  void updateUser(User user) {
    emit(UserState(user: user));
  }

  // Clear the user state
  void clearUser() {
    emit(UserState(user: null));
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
