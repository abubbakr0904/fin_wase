import '../../data/models/user_model/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  UserSuccessState({required this.users});

  final List<UserModel> users;
}

class UserErrorState extends UserState {
  UserErrorState({required this.errorText});

  final String errorText;
}

class UserDeletedState extends UserState {}
