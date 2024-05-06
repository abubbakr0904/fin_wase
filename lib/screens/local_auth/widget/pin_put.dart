import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PinPutTextView extends StatelessWidget {
  const PinPutTextView({
    super.key,
    required this.pinPutFocusMode,
    required this.pinPutController,
    required this.isError,
    this.onCompleted,
  });

  final FocusNode pinPutFocusMode;
  final TextEditingController pinPutController;
  final bool isError;
  final ValueChanged<String>? onCompleted;

  @override
  Widget build(BuildContext context) {
    final defaultPnTheme = PinTheme(
        width: 42.w,
        height: 42.h,
        textStyle: TextStyle(
            fontSize: 36.sp,
            color: Colors.grey
        )
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.38,
      child: Pinput(
        useNativeKeyboard: false,
        showCursor: false,
        length: 4,
        onCompleted: onCompleted,
        defaultPinTheme: defaultPnTheme,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        focusNode: pinPutFocusMode,
        controller: pinPutController,
        errorPinTheme: PinTheme(
            width: 42.w,
            height: 42.h,
            textStyle: TextStyle(fontSize: 36.w,color: Colors.black)
        ),
        preFilledWidget: Container(
          margin: EdgeInsets.all(10.w),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey
          ),
        ),
        obscureText: true,
        obscuringWidget: Container(
          margin: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isError ? Colors.red : Colors.green
          ),
        ),
        followingPinTheme: defaultPnTheme,
        pinAnimationType: PinAnimationType.slide,
      ),
    );
  }
}
