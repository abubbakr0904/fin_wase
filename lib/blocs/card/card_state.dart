import 'package:abu_pay/data/models/card_model/card_model.dart';
import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:equatable/equatable.dart';

class CardState extends Equatable {
  final CardModel cardModel;
  final String errorMessage;
  final String successMessage;
  final FormsSatus status;

  const CardState(
      {required this.errorMessage,
        required this.successMessage,
        required this.status,
        required this.cardModel});

  CardState copyWith(
      {String? errorMessage,
        String? successMessage,
        FormsSatus? status,
        CardModel? profileModel}) {
    return CardState(
        errorMessage: errorMessage ?? this.errorMessage,
        successMessage: successMessage ?? this.successMessage,
        status: status ?? this.status,
        cardModel: profileModel ?? this.cardModel);
  }

  @override
  List<Object> get props =>
      [status, errorMessage, successMessage, cardModel];
}
