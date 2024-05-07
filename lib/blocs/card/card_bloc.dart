import 'package:abu_pay/blocs/card/card_state.dart';
import 'package:abu_pay/blocs/user/user_event.dart';
import 'package:abu_pay/data/models/card_model/card_model.dart';
import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/data/repository/card_repository.dart';
import 'package:abu_pay/data/responce/network_responce.dart';
import 'package:bloc/bloc.dart';

import 'card_event.dart';
import 'card_event.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardReposritory cardReposritory;

  CardBloc(this.cardReposritory)
      : super(CardState(
            errorMessage: "",
            successMessage: "",
            status: FormsSatus.pure,
            cardModel: CardModel.initial(),
            cards: []
  )) {
    on<AddCardUserCollectionEvent>(_addCard);
    on<GetUserCards>(_getCards);
  }

  _addCard(AddCardUserCollectionEvent event, emit) async {
    NetworkResponse networkResponse =
        await cardReposritory.insertCard(event.cardModel);
    if (networkResponse.errorText.isEmpty) {
      print("malades---------------------------");
      emit(
        state.copyWith(
          status: FormsSatus.succes,
          profileModel: event.cardModel,
          successMessage: "orre"
        ),
      );
    } else {
      print("xato --------------------------");
      emit(state.copyWith(
        errorMessage: networkResponse.errorText,
        status: FormsSatus.error,
      ));
    }
  }

  _getCards(GetUserCards event, emit) async {
    NetworkResponse networkResponse = await cardReposritory.getCards();
    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          status: FormsSatus.succes,
          cards: networkResponse.data
        ),
      );
    } else {
      emit(state.copyWith(
        successMessage: networkResponse.errorText,
        status: FormsSatus.error,
      ));
    }
  }
}
