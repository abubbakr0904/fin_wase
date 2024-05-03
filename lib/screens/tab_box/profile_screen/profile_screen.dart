import 'package:abu_pay/blocs/user/user_event.dart';
import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:core';
import '../../../blocs/user/user_bloc.dart';
import '../../../blocs/user/user_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hammaga salom qannay ozi"),
      ),
      body : BlocBuilder<UserBloc , UserState>(
        builder: (context , state){
          return Container(
            child : TextButton(
              onPressed: (){
                ProfileModel profileModel = ProfileModel(username: "Abdulloh", lastname: "Hasanov", password: "sexy", email: "baubaubs@gmail.com", imageUrl: "hi", phoneNumber: "+998930374441", userId: "", fcmToken: "", uuid: "");
                context.read<UserBloc>().add(
                  AddUserCollectionEvent(profileModel: profileModel)
                );
              },
              child : Text("add")
            ),

          );
        },
      )
    );
  }
}
