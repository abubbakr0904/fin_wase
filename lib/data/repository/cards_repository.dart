import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/card_model/card_model.dart';
import '../responce/network_responce.dart';

class CardsRepository {
  Future<NetworkResponse> addCard(CardModel cardModel) async {
    try {
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection("card_user")
          .add(cardModel.toJson());

      await FirebaseFirestore.instance
          .collection("card_user")
          .doc(documentReference.id)
          .update({"cardId": documentReference.id});

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      debugPrint("CARD ADD ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> updateCard(CardModel cardModel) async {
    try {
      await FirebaseFirestore.instance
          .collection("card_user")
          .doc(cardModel.cardDocId)
          .update(cardModel.toJsonForUpdate());

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> deleteCard(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection("card_user")
          .doc(docId)
          .delete();

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Stream<List<CardModel>> getCardsByUserId(String userId) =>
      FirebaseFirestore.instance
          .collection("card_user")
          .where("userId", isEqualTo: userId)
          .snapshots()
          .map((event) =>
          event.docs.map((doc) => CardModel.fromJson(doc.data())).toList());

  Stream<List<CardModel>> getCardsDatabase() => FirebaseFirestore.instance
      .collection("card_base")
      .snapshots()
      .map((event) =>
      event.docs.map((doc) => CardModel.fromJson(doc.data())).toList());

  Stream<List<CardModel>> getActiveCards() => FirebaseFirestore.instance
      .collection("card_user")
      .snapshots()
      .map((event) =>
      event.docs.map((doc) => CardModel.fromJson(doc.data())).toList());
}