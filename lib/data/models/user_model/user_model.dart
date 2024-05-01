class UserModel {
  String email;
  String password;

  UserModel({
    required this.email,
    required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"] ?? "",
      password: json["phonenumber"] ?? "",

    );
  }

  toJson(){
    return {
      "email" : email,
      "phonenumber" : password
    };
  }
}
