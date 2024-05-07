import 'package:abu_pay/blocs/card/card_bloc.dart';
import 'package:abu_pay/blocs/card/card_event.dart';
import 'package:abu_pay/blocs/user/user_state.dart';
import 'package:abu_pay/data/models/card_model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                    keyboardType: TextInputType.number,

                  ),
                  SizedBox(height: 20.h,),
                  TextField(
                    controller: date,
                    keyboardType: TextInputType.number,
                  ),
                  TextButton(onPressed: () {
                    CardModel cardModel = CardModel(
                        cardHolder:state.carModel.username,
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
                    if(state.successMessage == "orre"){
                      Navigator.pop(context);
                    }
                    else{
                      Fluttertoast.showToast(
                        msg: "Card not found",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.red,
                        backgroundColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  }, child: Text("Add"))
                ],
              ),
            );
          },
        )
    );
  }
}
