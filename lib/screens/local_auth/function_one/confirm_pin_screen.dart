import 'dart:async';
import 'package:abu_pay/screens/local_auth/funvtion_two/touch_id_screen.dart';
import 'package:abu_pay/screens/local_auth/widget/pin_put.dart';
import 'package:abu_pay/screens/tab_box/tab_box/tab_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../data/local/storage_repository.dart';
import '../../../service/local_services.dart';
import '../widget/keyboard.dart';

class ConfirmPinScreen extends StatefulWidget {
  const ConfirmPinScreen({super.key, required this.previousPin});

  final String previousPin;
  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isError = false;
  bool isBiometricsEnabled = false;

  @override
  void initState() {
    BiometricAuthService.canAuthenticate().then(
          (value) {
        if (value) {
          isBiometricsEnabled = true;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry pin"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          Text(
            "Pin kodlar  O'mos emas!",
            style: TextStyle(fontSize: 20.sp),
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
                if (widget.previousPin == pinPutController.text) {
                  _setPin(pinPutController.text);
                } else {
                  isError = true;
                  pinPutController.clear();
                }
                pinPutController.text = "";
              }
              setState(() {});
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

  Future<void> _setPin(String pin) async {
    await StorageRepository.setString(key: "pin_code", value: pin);
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => isBiometricsEnabled ? const TouchIdScreen() : TabBox1() ), (route) => false);
  }
}