// import 'package:abu_pay/data/models/user_model/user_model.dart';
// import 'package:abu_pay/utils/utility_functions/utility_funstions.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import '../responce/network_responce.dart';
//
// class UserProfileRepository {
//   Future<NetworkResponse> addUser(ProfileModel profileModel) async {
//     // User? user = FirebaseAuth.instance.currentUser;
//     try {
//       DocumentReference documentReference = await FirebaseFirestore.instance
//           .collection("users")
//           .add(profileModel.toJson());
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(documentReference.id)
//           .update({"userId": documentReference.id, "uuid": profileModel.uuid});
//       return NetworkResponse(data: "succes");
//     } on FirebaseException catch (error) {
//       UtilityFunctions.printMethod("QOSHISHDA XATOLIK : $error");
//       return NetworkResponse(errorText: error.code);
//     }
//   }
//
//   Future<NetworkResponse> deleteUser(String docId) async {
//     try {
//       await FirebaseFirestore.instance.collection("users").doc(docId).delete();
//       return NetworkResponse(data: "success");
//     } on FirebaseException catch (error) {
//       debugPrint("O'chirishda xatolik : $error");
//       return NetworkResponse(errorText: error.code);
//     }
//   }
//
//   Future<NetworkResponse> updateUser(ProfileModel profileModel) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(profileModel.userId)
//           .update(profileModel.toJsonForUpdate());
//       return NetworkResponse(data: "succes");
//     } on FirebaseException catch (error) {
//       debugPrint("Updatedda Xatolik");
//       return NetworkResponse(errorText: error.code);
//     }
//   }
//
//   Future<NetworkResponse> getUserByDocId(String docId) async {
//     try {
//       DocumentSnapshot documentSnapshot =
//           await FirebaseFirestore.instance.collection("users").doc(docId).get();
//       return NetworkResponse(
//         data: ProfileModel.fromJson(
//             documentSnapshot.data() as Map<String, dynamic>),
//       );
//     } on FirebaseException catch (error) {
//       debugPrint("GET QILISHDA HATOLIK docid");
//       return NetworkResponse(errorText: error.code);
//     }
//   }
//
//   Future<NetworkResponse> getUserByUuId() async {
//     NetworkResponse networkResponse = NetworkResponse();
//
//     User? user = FirebaseAuth.instance.currentUser;
//     String uuId = user!.uid;
//
//
//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection("users")
//           .where("uuid", isEqualTo: uuId)
//           .get();
//
//       List<ProfileModel> users = querySnapshot.docs
//           .map((e) => ProfileModel.fromJson(e as Map<String , dynamic>))
//           .toList();
//
//       UtilityFunctions.printMethod("CURRENT USERS IS LENGTH: ${users.length}");
//
//       networkResponse.data =
//           users.isEmpty ? ProfileModel.initial() : users.first;
//     } on FirebaseException catch (_) {
//       networkResponse.errorText =
//           "Error :(  on FirebaseException catch (_) getUserByUuId ";
//     } catch (_) {
//       networkResponse.errorText = "Error :( catch (_) getUserByUuId ";
//     }
//
//     return networkResponse;
//   }
// }

import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:abu_pay/data/responce/network_responce.dart';
import 'package:abu_pay/utils/contants/app_constants.dart';
import 'package:abu_pay/utils/utility_functions/utility_funstions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProfileRepo {
  Future<NetworkResponse> insertUser(ProfileModel userModel) async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(AppConstants.users).get();

      List<ProfileModel> users = querySnapshot.docs
          .map((e) => ProfileModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      bool isExists = false;

      for (var user in users) {
        if (user.email == userModel.email) {
          isExists = true;
        }
      }

      if (!isExists) {
        DocumentReference documentReference = await FirebaseFirestore.instance
            .collection(
              AppConstants.users,
            )
            .add(
              userModel.toJson(),
            );
        await FirebaseFirestore.instance
            .collection(
              AppConstants.users,
            )
            .doc(
              documentReference.id,
            )
            .update({
          "userId": documentReference.id,
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

  Future<NetworkResponse> updateUser(ProfileModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection(
            AppConstants.users,
          )
          .doc(userModel.userId)
          .update(
            userModel.toJsonForUpdate(),
          );

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

  Future<NetworkResponse> deleteUser(String docID) async {
    try {
      await FirebaseFirestore.instance
          .collection(
            AppConstants.users,
          )
          .doc(
            docID,
          )
          .delete();

      return NetworkResponse(
        data: "success",
      );
    } on FirebaseException catch (error) {
      debugPrint(
        error.message,
      );
      return NetworkResponse(
        errorText: error.message ?? '',
      );
    }
  }

  Future<NetworkResponse> getUserByDocId(String docID) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(
            AppConstants.users,
          )
          .doc(
            docID,
          )
          .get();

      return NetworkResponse(
        data: ProfileModel.fromJson(
          documentSnapshot.data() as Map<String, dynamic>,
        ),
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

  Future<NetworkResponse> getUserByUUId() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(AppConstants.users).get();

      List<ProfileModel> users = querySnapshot.docs
          .map(
            (e) => ProfileModel.fromJson(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();
      ProfileModel profileModel = ProfileModel(username: "", lastname: "", password: "", email: "", imageUrl: "", phoneNumber: "", userId: "", fcmToken: "", uuid: "");
      for(var i in users){
        if(i.uuid == FirebaseAuth.instance.currentUser!.uid){
          profileModel = profileModel.copyWith(
            uuid: i.uuid,
            username: i.username,
            password: i.password,
            email: i.email,
            phoneNumber: i.phoneNumber,
            userId: i.userId,
          );
        }
      }

      UtilityFunctions.printMethod(
          "\$\$\$\$\$\$\nTHIS IS USERS IS LENGTH: ${users.length}\n\$\$\$\$\$\$");
      return NetworkResponse(
        data: users.isEmpty ? ProfileModel.initial() : profileModel,
      );
    } on FirebaseException catch (error) {
      debugPrint(
        error.message,
      );
      return NetworkResponse(
        errorText: error.message ?? '',
      );
    }
  }
}
