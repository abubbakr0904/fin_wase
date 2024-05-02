import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthState extends Equatable {
  final String errorMessage;
  final String succesMessage;
  final FormsSatus status;

  AuthState(
      {required this.errorMessage,
      required this.succesMessage,
      required this.status});

  AuthState copyWith({
    String? errorMessage,
    String? succesMessage,
    FormsSatus? status,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      succesMessage: succesMessage ?? this.succesMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, succesMessage];
}
