import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomKeyboardView extends StatelessWidget {
  CustomKeyboardView(
      {super.key,
        required this.number,
        required this.isBiometricsEnabled,
        required this.onClearButtonTap,
        this.onFingerPrintTap});

  final ValueChanged<String> number;
  final bool isBiometricsEnabled;
  final VoidCallback onClearButtonTap;
  final VoidCallback? onFingerPrintTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        children: [
          ...List.generate(
            9,
                (index) {
              return SizedBox(
                width: 20.w,
                height: 20.w,
                child: IconButton(
                  onPressed: () {
                    number.call("${index + 1}");
                  },
                  icon: Text(
                    "${index + 1}",
                    style:TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              );
            },
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.fingerprint_outlined , size: 40.sp,)),
          IconButton(
              onPressed: () {
                number.call("0");
              },
              icon: Text(
                    "0",
                style: TextStyle(fontSize: 25.sp , fontWeight: FontWeight.w700),
              )),
          IconButton(onPressed: onClearButtonTap, icon: Icon(Icons.backspace_outlined)),
        ],
      ),
    );
  }
}