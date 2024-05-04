import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  final String username;
  final String lastname;
  final String password;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String userId;
  final String fcmToken;
  final String uuid;

  ProfileModel(
      {required this.username,
      required this.lastname,
      required this.password,
      required this.email,
      required this.imageUrl,
      required this.phoneNumber,
      required this.userId,
      required this.fcmToken,
      required this.uuid});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        username: json["username"] ?? "",
        lastname: json["lastname"] ?? "",
        password: json["password"] ?? "",
        email: json["email"] ?? "",
        imageUrl: json["imageUrl"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        userId: json["userId"] ?? "",
        fcmToken: json["fcmToken"] ?? "",
        uuid: json["uuid"] ?? "");
  }

  static Map<String, dynamic> convertMap(DocumentSnapshot documentSnapshot) {
    return {
      "imageUrl": documentSnapshot["imageUrl"],
      "email": documentSnapshot["email"],
      "username": documentSnapshot["username"],
      "lastname": documentSnapshot["lastname"],
      "password": documentSnapshot["password"],
      "phoneNumber": documentSnapshot["phoneNumber"],
      "userId": documentSnapshot["userId"],
      "uuid": documentSnapshot["uuid"]
    };
  }

  ProfileModel copyWith({
    String? username,
    String? lastname,
    String? email,
    String? password,
    String? imageUrl,
    String? phoneNumber,
    String? userId,
    String? fcmToken,
    String? uuid,
  }) {
    return ProfileModel(
      username: username ?? this.username,
      lastname: lastname ?? this.lastname,
      password: password ?? this.password,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
      fcmToken: fcmToken ?? this.fcmToken,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "lastname": lastname,
      "password": password,
      "email": email,
      "imageUrl": imageUrl,
      "phoneNumber": phoneNumber,
      "userId": userId,
      "fcmToken": fcmToken,
      "uuid": uuid
    };
  }

  Map<String, dynamic> toJsonForApi() {
    return {
      "username": username,
      "password": password,
      "email": email,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "username": username,
      "lastname": lastname,
      "password": password,
      "email": email,
      "imageUrl": imageUrl,
      "phoneNumber": phoneNumber,
      "userId": userId,
    };
  }

  static ProfileModel initial() => ProfileModel(
      username: "",
      lastname: "",
      password: "",
      email: "",
      imageUrl: "",
      phoneNumber: "",
      userId: "",
      fcmToken: "",
      uuid: "");
}
