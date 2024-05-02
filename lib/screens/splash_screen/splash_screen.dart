import 'package:abu_pay/screens/route.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init()async{

    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamedAndRemoveUntil(context, RouteNames.onBoardingRoute, (route) => false);
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
      body : Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logo , width: 100.w, height: 110.w,),
            SizedBox(height: 10.h,),
            Text("FinWise" , style: TextStyle(
              color : Colors.white,
              fontSize: 52.sp,
              fontWeight: FontWeight.w700,
              fontFamily: AppImages.fontPoppins
            ),)

          ],
        ),
      )
    );
  }
}
