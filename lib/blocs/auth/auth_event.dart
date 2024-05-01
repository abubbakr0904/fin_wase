import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/user_model/user_model.dart';

abstract class UserManagerEvent {
  const UserManagerEvent();
}

class AddUserEvent extends UserManagerEvent {
  final UserModel userModel;

  const AddUserEvent({
    required this.userModel,
  });

  List<Object?> get props => [
    userModel,
  ];
}

class AddUserFireStoreEvent extends UserManagerEvent {
  final UserModel userModell;

  AddUserFireStoreEvent({required this.userModell});

  List<Object?> get props => [
    userModell, /*contextFirst*/
  ];
}

class AddAllUserEvent extends UserManagerEvent {
  final UserModel userModel;

  AddAllUserEvent({required this.userModel});

  List<Object?> get props => [
    userModel,
  ];
}

class CallUserEvent extends UserManagerEvent {}

class AllUserEvent extends UserManagerEvent {
  final List<User> users;

  AllUserEvent({required this.users});
}
