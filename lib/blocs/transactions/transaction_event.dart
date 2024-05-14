part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {}

class CheckValidationEvent extends TransactionEvent {
  @override
  List<Object?> get props => [];
}

class SetReceiverCardEvent extends TransactionEvent {
  SetReceiverCardEvent({required this.cardModel});

  final CardModel cardModel;

  @override
  List<Object?> get props => [cardModel];
}

class SetSenderCardEvent extends TransactionEvent {
  SetSenderCardEvent({required this.cardModel});

  final CardModel cardModel;

  @override
  List<Object?> get props => [cardModel];
}

class SetAmountEvent extends TransactionEvent {
  SetAmountEvent({required this.amount});

  final double amount;

  @override
  List<Object?> get props => [amount];
}

class RunTransactionEvent extends TransactionEvent {
  @override
  List<Object?> get props => [];
}

class SetInitialEvent extends TransactionEvent {
  @override
  List<Object?> get props => [];
}