import 'package:abu_pay/data/local/storage_repository.dart';
import 'package:abu_pay/screens/local_auth/function_one/confirm_pin_screen.dart';
import 'package:abu_pay/screens/local_auth/widget/keyboard.dart';
import 'package:abu_pay/screens/local_auth/widget/pin_put.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("set pin"),
      ),
      body: Column(
        children: [
         SizedBox(height: 60.h,),
          Text(
            "Pin kodni O'rnating!",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 32.h,),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: PinPutTextView(
                pinPutFocusMode: focusNode,
                pinPutController: pinPutController,
                isError: isError),
          ),
          SizedBox(height: 32.h,),
          CustomKeyboardView(
            number: (number) {
              if (pinPutController.length < 4) {
                pinPutController.text = "${pinPutController.text}$number";
              }
              if (pinPutController.length == 4) {
                print("aaaaaaaaaaaaaa\n\n\n\n");
                print(pinPutController.text);
                StorageRepository.setString(key: "pinkod", value: pinPutController.text);
                Navigator.push(context, CupertinoPageRoute(builder: (context)=> ConfirmPinScreen(previousPin: pinPutController.text)));
                pinPutController.text = "";
              }
            },
            isBiometricsEnabled: false,
            onClearButtonTap: () {
              if (pinPutController.length > 0) {
                pinPutController.text = pinPutController.text
                    .substring(0, pinPutController.text.length - 1);
              }
            },
          )
        ],
      ),
    );
  }
}