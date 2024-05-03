import 'package:abu_pay/blocs/auth/auth_bloc.dart';
import 'package:abu_pay/blocs/auth/auth_event.dart';
import 'package:abu_pay/blocs/user/user_bloc.dart';
import 'package:abu_pay/blocs/user/user_event.dart';
import 'package:abu_pay/data/models/user_model/user_model.dart';
import 'package:abu_pay/screens/tab_box/tab_box/tab_box.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../blocs/auth/auth_state.dart';
import '../../../utils/contants/app_constants.dart';
import '../../../utils/images/app_images.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  init() {
    password1.clear();
    password2.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: AppColors.accentBlue,
                padding: EdgeInsets.only(top: 101.h),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppImages.fontPoppins),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 187.h),
                padding: EdgeInsets.only(top: 60.h, left: 52.w, right: 52.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.r),
                      topLeft: Radius.circular(50.r),
                    ),
                    color: Colors.white),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fullname",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppImages.fontPoppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 41.h,
                        child: TextFormField(
                          controller: fullname,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if (!AppConstants.emailRegExp
                                .hasMatch(val)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (v) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFDFF7E2),
                            hintText: "Abubakr",
                            hintStyle: TextStyle(fontSize: 12.sp),
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
                        height: 8.h,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppImages.fontPoppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
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
                            } else if (!AppConstants.emailRegExp
                                .hasMatch(val)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (v) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFDFF7E2),
                            hintText: "example@gmail.com",
                            hintStyle: TextStyle(fontSize: 12.sp),
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
                        height: 8.h,
                      ),
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppImages.fontPoppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 41.h,
                        child: TextFormField(
                          controller: phoneNumber,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if (!AppConstants.emailRegExp
                                .hasMatch(val)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (v) {},
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFDFF7E2),
                            hintText: "+998931234567",
                            hintStyle: TextStyle(fontSize: 12.sp),
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
                        height: 8.h,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppImages.fontPoppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 41.h,
                        child: TextFormField(
                          obscureText: true,
                          controller: password1,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if (!AppConstants.emailRegExp
                                .hasMatch(val)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (v) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFDFF7E2),
                            hintText: "********",
                            hintStyle: TextStyle(fontSize: 12.sp),
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
                      Text(
                        "Repeat Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppImages.fontPoppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 41.h,
                        child: TextFormField(
                          obscureText: true,
                          controller: password2,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please fill in this field';
                            } else if (!AppConstants.emailRegExp
                                .hasMatch(val)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onChanged: (v) {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFDFF7E2),
                            hintText: "********",
                            hintStyle: TextStyle(fontSize: 12.sp),
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
                      SizedBox(height: 20.h),
                      Container(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "By continuing, you agree to Terms of Use and Privacy Policy.",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppImages.fontPoppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: double.infinity,
                        child: Center(
                          child: SizedBox(
                            width: 207.w,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      AppColors.accentBlue.withOpacity(0.2),
                                ),
                                onPressed: () {
                                  if (password2.text == password1.text) {
                                     state.profileModel.copyWith(
                                        username: fullname.text,
                                        password: password1.text,
                                        email: email.text,
                                        phoneNumber: phoneNumber.text,
                                     );
                                    context.read<AuthBloc>().add(
                                        RegisterUserEvent(
                                            profileModel: state.profileModel));
                                    context.read<UserBloc>().add(
                                      AddUserCollectionEvent(profileModel: state.profileModel)
                                    );
                                    Fluttertoast.showToast(
                                        msg: "Congratulation 😃",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.green,
                                        backgroundColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const TabBox1()),
                                        (route) => false);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Password is not correct",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.red,
                                        backgroundColor: Colors.white,
                                        fontSize: 16.0);
                                    init();
                                  }
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
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    password1.dispose();
    password2.dispose();
    phoneNumber.dispose();
    fullname.dispose();
    email.dispose();
    super.dispose();
  }
}
