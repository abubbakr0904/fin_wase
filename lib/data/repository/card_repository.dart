import 'package:abu_pay/data/models/card_model/card_model.dart';
import 'package:abu_pay/data/responce/network_responce.dart';
import 'package:abu_pay/utils/contants/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_model/user_model.dart';

class CardReposritory {
  Future<NetworkResponse> insertCard(CardModel cardModel) async {
    try {
      print("aaaa qoshiladi ");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.base,)
          .get();
      QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
          .collection(AppConstants.users,)
          .get();
      List<CardModel> cards = querySnapshot.docs
          .map((e) => CardModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      List<ProfileModel> users = querySnapshot1.docs
          .map((e) => ProfileModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      bool isExists = false;
      int a = 0;
      String dicid = '';
      for (var user in cards) {
        if (user.cardNumber == cardModel.cardNumber) {
          isExists = true;
          print("demak bor");
          break;

        }
        a++;
      }

      if (isExists) {
        DocumentReference documentReference = await FirebaseFirestore.instance
            .collection(
          AppConstants.cardbase,
        ).add(cardModel.toJson());
        print("QOSHILDI ");
        await FirebaseFirestore.instance
            .collection(AppConstants.cardbase,)
            .doc(documentReference.id,)
            .update({
          "cardDocId": documentReference.id,
          "userDocId" : dicid,
          "bankName" : cards[a].bankName,
          "cardName" : cards[a].cardName,
          "balance" : cards[a].balance,
          "expireDate" : cards[a].expireDate,
        });
      }
      return NetworkResponse(
        data: "success",
      );
    } on FirebaseException catch (error) {
      debugPrint(
        error.message,
      );
      return NetworkResponse(
        errorText: error.message ?? "NOMA'LUM XATOLIK!!!",
      );
    }
  }

  Stream<List<CardModel>> getCardByUserId() =>
      FirebaseFirestore.instance
          .collection(AppConstants.cardbase)
          .snapshots()
          .map((event) =>
          event.docs.map((e) => CardModel.fromJson(e.data())).toList());
}
