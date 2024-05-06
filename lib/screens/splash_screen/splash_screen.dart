// import 'package:abu_pay/screens/local_auth/entry_password.dart';
import 'package:abu_pay/screens/on_boarding/on_boarding_screen.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:abu_pay/utils/utility_functions/utility_funstions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/storage_repository.dart';
import '../../utils/images/app_images.dart';
import '../tab_box/tab_box/tab_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    await Future.delayed(const Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;
    if (mounted) {
      UtilityFunctions.printMethod("Katta qilin");
      if (user != null) {
        UtilityFunctions.printMethod("null emas");
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => const TabBox1()), (
            route) => false);
      } else {
        bool isNewUser = StorageRepository.getBool(key: "is_new_user");
        UtilityFunctions.printMethod(isNewUser);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()), (
                route) => false);
      }
  }

  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.accentBlue,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.logo,
                width: 100.w,
                height: 110.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "FinWise",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 52.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppImages.fontPoppins),
              )
            ],
          ),
        ));
  }
}
