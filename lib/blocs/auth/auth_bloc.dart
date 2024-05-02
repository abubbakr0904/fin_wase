import 'package:abu_pay/blocs/auth/auth_event.dart';
import 'package:abu_pay/blocs/auth/auth_state.dart';
import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/data/responce/network_responce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository)
      : super(AuthState(
            errorMessage: "", succesMessage: "", status: FormsSatus.pure)) {
    on<CheckAuthentication>(_checkAuthetication);
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<LogOutUserEvent>(_logOutUser);
    on<AddUserFirestore>(_addUserFirestore);
  }

  _checkAuthetication(CheckAuthentication event, emit) async {
    NetworkResponse networkResponse = await authRepository.checkUser();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(status: FormsSatus.auth),
      );
    } else {
      emit(
        state.copyWith(status: FormsSatus.error),
      );
    }
  }

  _loginUser(LoginUserEvent event, emit) async {
    NetworkResponse networkResponse =
        await authRepository.loginWithEmailAndPassword(
      email: event.profileModel.email,
      password: event.profileModel.password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(status: FormsSatus.auth),
      );
    } else {
      emit(
        state.copyWith(status: FormsSatus.error , errorMessage: networkResponse.errorText),
      );
    }
  }

  _registerUser(RegisterUserEvent event, emit) async {
    NetworkResponse networkResponse =
        await authRepository.registerWithEmailAndPassword(
      email: event.profileModel.email,
      password: event.profileModel.password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(status: FormsSatus.auth),
      );
    } else {
      emit(
        state.copyWith(status: FormsSatus.error , errorMessage: networkResponse.errorText),
      );
    }
  }

  _logOutUser(LogOutUserEvent event, emit) async {
    await authRepository.logOutUser();
  }
  _addUserFirestore(AddUserFirestore event , emit) async {
    final db = FirebaseFirestore.instance;
    await db.collection("users").add(event.profileModel.toJson());
  }
}
