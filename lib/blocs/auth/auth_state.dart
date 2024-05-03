import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String succesMessage;
  final FormsSatus status;
  final ProfileModel profileModel;

  AuthState(
      {required this.errorMessage,
      required this.succesMessage,
      required this.status,
      required this.profileModel
       });

  AuthState copyWith({
    String? errorMessage,
    String? succesMessage,
    FormsSatus? status,
    ProfileModel? profileModel
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      succesMessage: succesMessage ?? this.succesMessage,
      status: status ?? this.status,
      profileModel: profileModel ?? this.profileModel
    );
  }

  @override
  List<Object> get props => [status, errorMessage, succesMessage];
}
