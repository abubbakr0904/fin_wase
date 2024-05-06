import 'package:abu_pay/screens/tab_box/tab_box/tab_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/local/storage_repository.dart';
import '../../../service/local_services.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';

class TouchIdScreen extends StatefulWidget {
  const TouchIdScreen({super.key});

  @override
  State<TouchIdScreen> createState() => _TouchIdScreenState();
}

class _TouchIdScreenState extends State<TouchIdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Touch id"),
      ),
      body: Column(
        children: [
          Icon(
            Icons.fingerprint_outlined,
            size: 100.sp,
            color: Colors.blueAccent,
          ),
          SizedBox(
            width: 207.w,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.accentBlue),
                onPressed: enableBiometrics,
                child: Text(
                  "Biometrik Auth",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppImages.fontPoppins),
                )),
          ),
          SizedBox(
            width: 207.w,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.accentBlue),
                onPressed: (){
                  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=> const TabBox1()), (route) => false);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppImages.fontPoppins),
                )),
          ),
        ],
      ),
    );
  }
  Future <void> enableBiometrics()async
  {
    bool authenticated = await BiometricAuthService.authenticate();
    if (authenticated) {
      await StorageRepository.setBool(
          key: "biometrics_enabled", value: true);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Biometrics Enabled"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Biometrics Error"),
        ),
      );
    }
    if(!context.mounted) return;
    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context)=> const TabBox1()), (route) => false);
  }
}