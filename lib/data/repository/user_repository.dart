import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../responce/network_responce.dart';

class UserProfileRepository {
  Future<NetworkResponse> addUser(ProfileModel profileModel) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(
          "users").get();
      List<ProfileModel> users = querySnapshot.docs.map((e) =>
          ProfileModel.fromJson(e.data() as Map<String, dynamic>)).toList();
      bool isHave = false;
      for (var user in users) {
        if (user.email == profileModel.email) {
          isHave = true;
        }
      }
      if (isHave == false) {
        DocumentReference documentReference = await FirebaseFirestore.instance
            .collection("users").add(profileModel.toJson());
        await FirebaseFirestore.instance.collection("users").doc(
            documentReference.id).update({"userId": documentReference.id});
      }
      return NetworkResponse(data: "succes");
    } on FirebaseException catch (error) {
      debugPrint("QOSHISHDA XATOLIK : ${error}");
      return NetworkResponse(errorText: error.code);
    }
  }

  Future<NetworkResponse> deleteUser(String docId) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(docId).delete();
      return NetworkResponse(data: "succes");
    } on FirebaseException catch (error) {
      debugPrint("O'chirishda xatolik : ${error}");
      return NetworkResponse(errorText: error.code);
    }
  }

  Future<NetworkResponse> updateUser(ProfileModel profileModel) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(
          profileModel.userId).update(profileModel.toJsonForUpdate());
      return NetworkResponse(data: "succes");
    } on FirebaseException catch (error) {
      debugPrint("Updatedda Xatolik");
      return NetworkResponse(errorText: error.code);
    }
  }

  Future<NetworkResponse> getUserByDocId(String docId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users").doc(docId).get();
      return NetworkResponse(data: ProfileModel.fromJson(
          documentSnapshot.data() as Map<String, dynamic>),);
    } on FirebaseException catch(error){
      debugPrint("GET QILISHDA HATOLIK docid");
      return NetworkResponse(errorText: error.code);
    }
  }
  Future<NetworkResponse> getuserById(String uid) async {
    try{
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").where("uuid" , isEqualTo : uid).get();
      List<ProfileModel> users = querySnapshot.docs.map((e) => ProfileModel.fromJson(e.data() as Map<String , dynamic>)).toList();
      return NetworkResponse(data: users.isEmpty ? ProfileModel.initial() : users.first);
    } on FirebaseException catch(error){
      debugPrint("GET QILISHDA HATOLIK uid");
      return NetworkResponse(errorText: error.code);
    }
  }
}