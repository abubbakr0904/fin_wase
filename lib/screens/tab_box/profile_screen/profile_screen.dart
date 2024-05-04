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
          title: const Text("hammaga salom qannay ozi"),
        ),
        body: BlocConsumer<UserBloc, UserState>(
          builder: (context, state) {
            if(state.successMessage == "authjon"){

            }
            return Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Text(
                            "${state.profileModel.username}\n${state.profileModel.email}"))),
                const Text("Qondaye")
              ],
            );
          },
          listener: (BuildContext context , UserState){},
        ));
  }
}
