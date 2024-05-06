
import 'dart:async';
import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/screens/auth/auth_screen/auth_screen.dart';
import 'package:abu_pay/screens/local_auth/widget/keyboard.dart';
import 'package:abu_pay/screens/local_auth/widget/pin_put.dart';
import 'package:abu_pay/screens/tab_box/tab_box/tab_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/auth/auth_event.dart';
import '../../../blocs/auth/auth_state.dart';
import '../../../data/local/storage_repository.dart';
import '../../../service/local_services.dart';

class EntryPinScreen extends StatefulWidget {
  const EntryPinScreen({
    super.key,
  });

  @override
  State<EntryPinScreen> createState() => _EntryPinScreenState();
}

class _EntryPinScreenState extends State<EntryPinScreen> {
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isError = false;
  bool biometricsEnabled = false;
  int attemptCount = 0;
  String currentPin = "";

  @override
  void initState() {
    biometricsEnabled = StorageRepository.getBool(key: "biometrics_enabled");
    currentPin = StorageRepository.getString(key: "pin_code");
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
          SizedBox(height: 60.h,),
          Text(
            "Pin kod kiriting!",
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
          Text(
            isError ? "Pin kod noto'g'ri!" : "",
            style: TextStyle(fontSize: 20.sp, color: Colors.red),
          ),
          if (MediaQuery.of(context).size.height > 700) SizedBox(height: 32.h,),
          CustomKeyboardView(
            onFingerPrintTap: checkBiometrics,
            number: (number) {
              if (pinPutController.length < 4) {
                pinPutController.text = "${pinPutController.text}$number";
              }
              if (pinPutController.length == 4) {
                if (currentPin == pinPutController.text) {
                  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=> const TabBox1()), (route) => false);
                } else {
                  attemptCount++;
                  if (attemptCount == 3) {
                    context.read<AuthBloc>().add(LogOutUserEvent());
                  }
                  isError = true;
                  pinPutController.clear();
                }
                pinPutController.text = "";
              }
              setState(() {});
            },
            isBiometricsEnabled: biometricsEnabled,
            onClearButtonTap: () {
              if (pinPutController.length > 0) {
                pinPutController.text = pinPutController.text
                    .substring(0, pinPutController.text.length - 1);
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == FormsSatus.unauth) {
                Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=> const AuthScreen()), (route) => false);
              }
            },
            child: const SizedBox(),
          )
        ],
      ),
    );
  }

  Future<void> checkBiometrics() async {
    bool authenticated = await BiometricAuthService.authenticate();
    if (authenticated) {
      if (!context.mounted) return;
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> const TabBox1()));
    }
  }
}
