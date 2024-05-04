import 'package:abu_pay/blocs/user/user_event.dart';
import 'package:abu_pay/blocs/user/user_state.dart';
import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:abu_pay/data/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/responce/network_responce.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserProfileRepository userRepository;

  UserBloc(this.userRepository)
      : super(UserState(
            errorMessage: "",
            successMessage: "",
            status: FormsSatus.pure,
            profileModel: ProfileModel.initial())) {
    on<AddUserCollectionEvent>(_addUserCollection);
    on<DeleteUserCollectionEvent>(_deleteUserCollection);
    on<UpdateUserCollectionEvent>(_updateUserCollection);
    on<GetUserByDocId>(_getUserByDocId);
    on<GetCurrentuser>(_getUser);
  }
  _addUserCollection(AddUserCollectionEvent event, emit) async {
    NetworkResponse networkResponse =
        await userRepository.addUser(event.profileModel);
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsSatus.auth));
    } else {
      emit(state.copyWith(
        errorMessage: networkResponse.errorText,
        status: FormsSatus.error,
      ));
    }
  }

  _deleteUserCollection(DeleteUserCollectionEvent event, emit) async {
    NetworkResponse networkResponse =
        await userRepository.deleteUser(event.profileModel.userId);
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsSatus.auth));
    } else {
      emit(state.copyWith(
          errorMessage: networkResponse.errorText, status: FormsSatus.error));
    }
  }

  _updateUserCollection(UpdateUserCollectionEvent event, emit) async {
    NetworkResponse networkResponse =
        await userRepository.updateUser(event.profileModel);
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsSatus.auth));
    } else {
      emit(state.copyWith(
          errorMessage: networkResponse.errorText, status: FormsSatus.error));
    }
  }

  _getUserByDocId(GetUserByDocId event, emit) async {
    NetworkResponse networkResponse =
        await userRepository.getUserByDocId(event.docId);
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsSatus.auth));
    } else {
      emit(state.copyWith(
          errorMessage: networkResponse.errorText, status: FormsSatus.error));
    }
  }

  _getUser(GetCurrentuser event, emit) async {
    NetworkResponse networkResponse = await userRepository.getUserByUuId();
    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(status: FormsSatus.auth , ));
    } else {
      emit(state.copyWith(
          errorMessage: networkResponse.errorText, status: FormsSatus.error , successMessage: "authbekz"));
    }
  }
}
