import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model/user_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class UserBloc extends Bloc<UserManagerEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<AddUserEvent>(_addUser);
    on<AddUserFireStoreEvent>(_addUserCloudStore);
    on<CallUserEvent>(_getAllUsers);
  }

  _addUser(AddUserEvent event, emit) async {
    print("Kirdi bu auth");
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.userModel.email,
        password: event.userModel.password
    );
  }

  _addUserCloudStore(AddUserFireStoreEvent event, emit) async {
    final fireDb = FirebaseFirestore.instance;
    await fireDb.collection("users").add(event.userModell.toJson());
  }

  _getAllUsers(CallUserEvent event, emit) async {
    emit(UserLoadingState());
    final db = FirebaseFirestore.instance;
    emit(UserSuccessState(users: await db.collection("users").get().then((value) =>
        value.docs.map((e) => UserModel.fromJson(e.data())).toList(),),),);
  }
}
