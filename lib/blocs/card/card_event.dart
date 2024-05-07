import 'package:equatable/equatable.dart';

import '../../data/models/card_model/card_model.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();
}


class AddCardCollectionEvent extends CardEvent {
  final CardModel cardModel;

  AddCardCollectionEvent({required this.cardModel});

  @override
  List<Object> get props => [cardModel];
}


class AddCardUserCollectionEvent extends CardEvent {
  final CardModel cardModel;

  AddCardUserCollectionEvent({required this.cardModel});

  @override
  List<Object> get props => [cardModel];
}