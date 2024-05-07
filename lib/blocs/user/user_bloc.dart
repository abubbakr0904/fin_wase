// import 'package:abu_pay/blocs/user/user_event.dart';
// import 'package:abu_pay/blocs/user/user_state.dart';
// import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
// import 'package:abu_pay/data/models/user_model/user_model.dart';
// import 'package:abu_pay/data/repository/user_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/responce/network_responce.dart';
//
// class UserBloc extends Bloc<UserEvent, UserState> {
//   final UserProfileRepository userRepository;
//
//   UserBloc(this.userRepository)
//       : super(UserState(
//             errorMessage: "",
//             successMessage: "",
//             status: FormsSatus.pure,
//             profileModel: ProfileModel.initial())) {
//     on<AddUserCollectionEvent>(_addUserCollection);
//     on<DeleteUserCollectionEvent>(_deleteUserCollection);
//     on<UpdateUserCollectionEvent>(_updateUserCollection);
//     on<GetUserByDocId>(_getUserByDocId);
//     on<GetCurrentuser>(_getUser);
//   }
//   _addUserCollection(AddUserCollectionEvent event, emit) async {
//     NetworkResponse networkResponse =
//         await userRepository.addUser(event.profileModel);
//     if (networkResponse.errorText.isEmpty) {
//       emit(state.copyWith(status: FormsSatus.auth));
//     } else {
//       emit(state.copyWith(
//         errorMessage: networkResponse.errorText,
//         status: FormsSatus.error,
//       ));
//     }
//   }
//
//   _deleteUserCollection(DeleteUserCollectionEvent event, emit) async {
//     NetworkResponse networkResponse =
//         await userRepository.deleteUser(event.profileModel.userId);
//     if (networkResponse.errorText.isEmpty) {
//       emit(state.copyWith(status: FormsSatus.auth));
//     } else {
//       emit(state.copyWith(
//           errorMessage: networkResponse.errorText, status: FormsSatus.error));
//     }
//   }
//
//   _updateUserCollection(UpdateUserCollectionEvent event, emit) async {
//     NetworkResponse networkResponse =
//         await userRepository.updateUser(event.profileModel);
//     if (networkResponse.errorText.isEmpty) {
//       emit(state.copyWith(status: FormsSatus.auth));
//     } else {
//       emit(state.copyWith(
//           errorMessage: networkResponse.errorText, status: FormsSatus.error));
//     }
//   }
//
//   _getUserByDocId(GetUserByDocId event, emit) async {
//     NetworkResponse networkResponse =
//         await userRepository.getUserByDocId(event.docId);
//     if (networkResponse.errorText.isEmpty) {
//       emit(state.copyWith(status: FormsSatus.auth));
//     } else {
//       emit(state.copyWith(
//           errorMessage: networkResponse.errorText, status: FormsSatus.error));
//     }
//   }
//
//   _getUser(GetCurrentuser event, emit) async {
//     NetworkResponse networkResponse = await userRepository.getUserByUuId();
//     if (networkResponse.errorText.isEmpty) {
//       emit(state.copyWith(status: FormsSatus.auth));
//     } else {
//       emit(state.copyWith(
//           errorMessage: networkResponse.errorText, status: FormsSatus.error));
//     }
//   }
// }

import 'package:abu_pay/blocs/user/user_event.dart';
import 'package:abu_pay/blocs/user/user_state.dart';
import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:abu_pay/data/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/responce/network_responce.dart';

class UserProfileBloc extends Bloc<UserEvent, UserState> {
  UserProfileBloc(this.userProfileRepository)
      : super(UserState(
    carModel: ProfileModel.initial(),
    status: FormsSatus.pure,
    errorMessage: "",
    successMessage: "",
  )) {
    on<AddUserCollectionEvent>(_addUser);
    on<UpdateUserCollectionEvent>(_updateUser);
    on<DeleteUserCollectionEvent>(_deleteUser);
    on<GetUserByDocId>(_getUserByDocId);
    on<GetCurrentuser>(_getUser);
  }

  final UserProfileRepo userProfileRepository;

  _addUser(AddUserCollectionEvent event, emit) async {
    emit(state.copyWith(status: FormsSatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.insertUser(event.profileModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          status: FormsSatus.succes,
          profileModel: event.profileModel,
        ),
      );
    } else {
      emit(state.copyWith(
        successMessage: networkResponse.errorText,
        status: FormsSatus.error,
      ));
    }
  }

  _updateUser(UpdateUserCollectionEvent event, emit) async {
    emit(state.copyWith(status: FormsSatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.updateUser(event.profileModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          status: FormsSatus.succes,
          profileModel: event.profileModel,
        ),
      );
    } else {
      emit(state.copyWith(
        successMessage: networkResponse.errorText,
        status: FormsSatus.error,
      ));
    }
  }

  _deleteUser(DeleteUserCollectionEvent event, emit) async {
    emit(state.copyWith(status: FormsSatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.deleteUser(event.profileModel.userId);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          status: FormsSatus.succes,
          profileModel: ProfileModel.initial(),
        ),
      );
    } else {
      emit(state.copyWith(
        successMessage: networkResponse.errorText,
        status: FormsSatus.error,
      ));
    }
  }

  _getUserByDocId(GetUserByDocId event, emit) async {
    emit(state.copyWith(status: FormsSatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.getUserByDocId(event.docId);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          status: FormsSatus.succes,
          profileModel: networkResponse.data as ProfileModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          successMessage: networkResponse.errorText,
          status: FormsSatus.error,
        ),
      );
    }
  }

  _getUser(GetCurrentuser event, emit) async {
    emit(state.copyWith(status: FormsSatus.loading));

    NetworkResponse networkResponse =
    await userProfileRepository.getUserByUUId();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          status: FormsSatus.succes,
          profileModel: networkResponse.data as ProfileModel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          successMessage: networkResponse.errorText,
          status: FormsSatus.error,
        ),
      );
    }
  }
}
