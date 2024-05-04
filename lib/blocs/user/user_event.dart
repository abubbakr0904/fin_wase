import 'package:equatable/equatable.dart';

import '../../data/models/user_model/user_model.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddUserCollectionEvent extends UserEvent {
  final ProfileModel profileModel;

  AddUserCollectionEvent({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class UpdateUserCollectionEvent extends UserEvent {
  final ProfileModel profileModel;

  UpdateUserCollectionEvent({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class DeleteUserCollectionEvent extends UserEvent {
  final ProfileModel profileModel;

  DeleteUserCollectionEvent({required this.profileModel});

  @override
  List<Object> get props => [profileModel];
}

class GetUserByDocId extends UserEvent {
  final String docId;

  GetUserByDocId({required this.docId});

  @override
  List<Object> get props => [docId];
}

class GetCurrentuser extends UserEvent {
  final String uid;

  GetCurrentuser({required this.uid});

  @override
  List<Object> get props => [uid];
}
