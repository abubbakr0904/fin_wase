import 'dart:ui';

import 'package:abu_pay/screens/auth/login_screen/login_screen.dart';
import 'package:abu_pay/screens/auth/register_screen/register_screen.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:abu_pay/utils/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(70.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppImages.logoGreen,
              width: 100.w,
              height: 100.w,
            ),
            Text(
              "FinWise",
              style: TextStyle(
                  color: AppColors.accentBlue,
                  fontSize: 52.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppImages.fontPoppins),
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod. ",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: AppImages.fontPoppins,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 42.h,
            ),
            SizedBox(
              width: 207.w,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.accentBlue),
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>const LogInScreen()));
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins),
                  )),
            ),
            SizedBox(height: 15.h,),
            SizedBox(
              width: 207.w,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.accentBlue.withOpacity(0.2),),
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> const RegisterScreen()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins),
                  )),
            ),
            SizedBox(height: 10.h,),
            Text("Forgot Password?" , style: TextStyle(
              color : Colors.black,
              fontFamily: AppImages.fontPoppins,
              fontWeight:FontWeight.w500,
              fontSize: 14.sp
            ),)
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
