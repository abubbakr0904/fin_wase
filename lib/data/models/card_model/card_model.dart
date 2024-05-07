import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel {
  final String cardHolder;
  final String cardName;
  final String cardNumber;
  final String expireDate;
  final String userDocId;
  final int type;
  final String cvc;
  final String icon;
  final double balance;
  final String bankName;
  final String cardDocId;
  final String color;
  final bool isMain;

  CardModel(
      {required this.cardHolder,
      required this.cardName,
      required this.expireDate,
      required this.userDocId,
      required this.type,
      required this.cvc,
      required this.icon,
      required this.balance,
      required this.bankName,
      required this.cardDocId,
      required this.color,
        required this.cardNumber,
      required this.isMain});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        cardHolder: json["cardHolder"] ?? "",
        cardName: json["cardName"] ?? "",
        expireDate: json["expireDate"] ?? "",
        userDocId: json["userDocId"] ?? "",
        type: json['type'] ?? 0,
        cvc: json["cvc"] ?? "",
        icon: json["icon"] ?? "",
        balance: json["balance"] ?? 0,
        bankName: json["bankName"] ?? "",
        cardDocId: json["cardDocId"] ?? "",
        color: json["color"] ?? "",
        cardNumber: json["cardNumber"] ?? "",
        isMain: json["isMain"] ?? false);
  }

  CardModel copyWith(
      {String? cardHolder,
      String? cardName,
      String? expireDate,
      String? userDocId,
      int? type,
      String? cvc,
      String? icon,
      String? bankName,
      String? cardDocId,
      String? color,
      String? cardNumber,
      bool? isMain,
      double? balance}) {
    return CardModel(
        cardHolder: cardHolder ?? this.cardHolder,
        cardName: cardName ?? this.cardName,
        expireDate: expireDate ?? this.expireDate,
        userDocId: userDocId ?? this.userDocId,
        type: type ?? this.type,
        cvc: cvc ?? this.cvc,
        icon: icon ?? this.icon,
        balance: balance ?? this.balance,
        bankName: bankName ?? this.bankName,
        cardDocId: cardDocId ?? this.cardDocId,
        color: color ?? this.color,
        cardNumber: cardNumber ?? this.cardNumber,
        isMain: isMain ?? this.isMain);
  }

  Map<String, dynamic> toJson() {
    return {
      "cardHolder": cardHolder,
      "cardName": cardName,
      "expireDate": expireDate,
      "userDocId": userDocId,
      "type": type,
      "cvc": cvc,
      "icon": icon,
      "balance": balance,
      "bankName": bankName,
      "cardDocId": cardDocId,
      "isMain": isMain,
      "cardNumber": cardNumber,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "cardName": cardName,
      "balance": balance,
      "isMain": isMain,
    };
  }

  static CardModel initial() => CardModel(
      cardHolder: "",
      cardName: "",
      expireDate: "",
      userDocId: "",
      type: 0,
      cvc: "",
      icon: '',
      balance: 0.0,
      bankName: "",
      cardDocId: "",
      color: "",
      cardNumber: "",
      isMain: false);
}
