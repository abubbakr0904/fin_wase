import 'dart:ui';

import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:core';
import '../../../blocs/user/user_bloc.dart';
import '../../../blocs/user/user_state.dart';
import '../../../utils/images/app_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<UserProfileBloc, UserState>(
      builder: (context, state) {
        if (state.successMessage == "authjon") {
          print(state.profileModel.username);
        }
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 40.w),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: AppColors.accentBlue,
              child: Text(
                "Edit my Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppImages.fontPoppins),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 200.h),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.r),
                      topLeft: Radius.circular(50.r),
                    ),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50.h
                        ),
                        width: double.infinity,
                        child : Column(
                          children: [
                            Text(
                              state.profileModel.username,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppImages.fontPoppins,
                              ),
                            ),
                            Text(
                              state.profileModel.email,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppImages.fontPoppins,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                      ),
                      Container(
                          width: double.infinity,
                          child : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 57.w,
                                  height: 57.h,
                                  margin: EdgeInsets.only(top: 30.h),
                                  decoration: BoxDecoration(
                                      color: AppColors.accentBlue,
                                      borderRadius: BorderRadius.circular(25.r)
                                  ),
                                  child : Center(
                                      child : SvgPicture.asset(AppImages.profile)
                                  )
                              ),
                              Text("Edit Profile" , style: TextStyle(
                                  color : Colors.black,
                                  fontFamily: AppImages.fontPoppins,
                                  fontWeight:FontWeight.w500,
                                  fontSize: 20.sp
                              ),)
                            ],
                          )
                      ),
                      Container(
                          width: double.infinity,
                          child : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 57.w,
                                  height: 57.h,
                                  margin: EdgeInsets.only(top: 30.h),
                                  decoration: BoxDecoration(
                                      color: AppColors.accentBlue,
                                      borderRadius: BorderRadius.circular(25.r)
                                  ),
                                  child : Center(
                                      child : SvgPicture.asset(AppImages.profile)
                                  )
                              ),
                              Text("Edit Profile" , style: TextStyle(
                                  color : Colors.black,
                                  fontFamily: AppImages.fontPoppins,
                                  fontWeight:FontWeight.w500,
                                  fontSize: 20.sp
                              ),)
                            ],
                          )
                      ),
                      Container(
                          width: double.infinity,
                          child : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 57.w,
                                  height: 57.h,
                                  margin: EdgeInsets.only(top: 30.h),
                                  decoration: BoxDecoration(
                                      color: AppColors.accentBlue,
                                      borderRadius: BorderRadius.circular(25.r)
                                  ),
                                  child : Center(
                                      child : SvgPicture.asset(AppImages.profile)
                                  )
                              ),
                              Text("Edit Profile" , style: TextStyle(
                                  color : Colors.black,
                                  fontFamily: AppImages.fontPoppins,
                                  fontWeight:FontWeight.w500,
                                  fontSize: 20.sp
                              ),)
                            ],
                          )
                      ),
                    ],
                  ),
                )),
            Container(
              width: double.infinity,
              height: 400.h,
              child : Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(AppImages.profilePng , width: 120.w,height: 120.w,fit : BoxFit.cover)),
              )
            )
          ],
        );
      },
      listener: (context, state) {},
    ));
  }
}
