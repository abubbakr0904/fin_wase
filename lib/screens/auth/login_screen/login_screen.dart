import 'package:abu_pay/blocs/auth/auth_bloc.dart';
import 'package:abu_pay/blocs/auth/auth_event.dart';
import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:abu_pay/utils/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/contants/app_constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 101.sp),
                color: AppCOlors.accentBlue,
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppImages.fontPoppins),
                  textAlign: TextAlign.center,
                )),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 187.h),
              padding: EdgeInsets.only(top: 60.h, left: 52.w, right: 52.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.r),
                    topLeft: Radius.circular(50.r),
                  )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppImages.fontPoppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 41.h,
                      child: TextFormField(
                        controller: email,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          } else if (!AppConstants.emailRegExp.hasMatch(val)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFDFF7E2),
                          hintText: "example@example.com",
                          hintStyle: TextStyle(fontSize: 13.sp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.r),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.r),
                              borderSide: BorderSide.none),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: AppImages.fontPoppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 41.h,
                      child: TextFormField(
                        controller: password,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          } else if (!AppConstants.passwordRegExp
                              .hasMatch(val)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFDFF7E2),
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 13.sp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.r),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.r),
                              borderSide: BorderSide.none),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 51.h,
                    ),
                    SizedBox(
                      width: 207.w,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppCOlors.accentBlue),
                          onPressed: () {
                            UserModel userModel = UserModel(
                                email: email.text, password: password.text);
                            context
                                .read<UserBloc>()
                                .add(AddUserEvent(userModel: userModel));
                            context.read<UserBloc>().add(
                                AddUserFireStoreEvent(userModell: userModel));
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
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppImages.fontPoppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      width: 207.w,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              AppCOlors.accentBlue.withOpacity(0.2),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppImages.fontPoppins),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Use fingerprint  to access",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppImages.fontPoppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppImages.facebookLogo),
                        SizedBox(width: 20.w),
                        SvgPicture.asset(AppImages.googleLogo),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Don’t have an account? Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppImages.fontPoppins,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
