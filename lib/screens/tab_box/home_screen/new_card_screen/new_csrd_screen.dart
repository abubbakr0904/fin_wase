import 'package:abu_pay/blocs/card/card_bloc.dart';
import 'package:abu_pay/blocs/card/card_event.dart';
import 'package:abu_pay/blocs/user/user_state.dart';
import 'package:abu_pay/data/models/card_model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../blocs/user/user_bloc.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController number = TextEditingController();
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Card"),
        ),
        body: BlocBuilder<UserProfileBloc, UserState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: number,
                  ),
                  SizedBox(height: 20.h,),
                  TextField(
                    controller: date,
                  ),
                  TextButton(onPressed: () {
                    CardModel cardModel = CardModel(
                        cardHolder:state.profileModel.username,
                        cardName: "",
                        expireDate: date.text,
                        userDocId: "",
                        type: 1,
                        cvc: "",
                        icon: "",
                        balance: 0,
                        bankName: "",
                        cardDocId: "",
                        color: "",
                        cardNumber: number.text,
                        isMain: false);
                    BlocProvider.of<CardBloc>(context).add(
                      AddCardUserCollectionEvent(cardModel: cardModel)
                    );
                  }, child: Text("Add"))
                ],
              ),
            );
          },
        )
    );
  }
}
