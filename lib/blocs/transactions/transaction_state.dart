part of 'transaction_bloc.dart';

class TransactionState{
  const TransactionState({
    required this.status,
    required this.errorMessage,
    required this.statusMessage,
    required this.amount,
    required this.receiverCard,
    required this.senderCard,
  });

  final CardModel receiverCard;
  final CardModel senderCard;
  final double amount;
  final FormsSatus status;
  final String errorMessage;
  final String statusMessage;

  TransactionState copyWith({
    CardModel? receiverCard,
    CardModel? senderCard,
    double? amount,
    FormsSatus? status,
    String? errorMessage,
    String? statusMessage,
  }) =>
      TransactionState(
        status: status ?? this.status,
        receiverCard: receiverCard ?? this.receiverCard,
        senderCard: senderCard ?? this.senderCard,
        amount: amount ?? this.amount,
        errorMessage: errorMessage ?? this.errorMessage,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    statusMessage,
    receiverCard,
    senderCard,
    amount,
  ];
}