import 'package:equatable/equatable.dart';

import '../../data/models/user_model/user_model.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckAuthentication extends AuthEvent {
  @override
  List<Object> get props => [];
}

class LoginUserEvent extends AuthEvent {
  final ProfileModel profileModel;

  LoginUserEvent({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class RegisterUserEvent extends AuthEvent {
  final ProfileModel profileModel;

  RegisterUserEvent({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class AddUserFirestore extends AuthEvent {
  final ProfileModel profileModel;

  AddUserFirestore({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class LogOutUserEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
