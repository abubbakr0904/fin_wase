import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final ProfileModel profileModel;
  final String errorMessage;
  final String successMessage;
  final FormsSatus status;

  const UserState(
      {required this.errorMessage,
      required this.successMessage,
      required this.status,
      required this.profileModel});

  UserState copyWith(
      {String? errorMessage,
      String? successMessage,
      FormsSatus? status,
      ProfileModel? profileModel}) {
    return UserState(
        errorMessage: errorMessage ?? this.errorMessage,
        successMessage: successMessage ?? this.successMessage,
        status: status ?? this.status,
        profileModel: profileModel ?? this.profileModel);
  }

  @override
  List<Object> get props =>
      [status, errorMessage, successMessage, profileModel];
}
