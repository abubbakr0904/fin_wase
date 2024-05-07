import 'package:abu_pay/blocs/card/card_bloc.dart';
import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/screens/tab_box/home_screen/new_card_screen/new_csrd_screen.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:abu_pay/utils/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/card/card_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: AppColors.accentBlue,
              padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 30.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Welcome Back",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppImages.fontPoppins),
                          ),
                          Text(
                            "Good morning ☺️",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppImages.fontPoppins),
                          )
                        ],
                      ),
                      Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              color: Colors.white),
                          child: Center(
                              child: Icon(
                            Icons.notifications,
                            color: AppColors.accentBlue,
                          )))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.total),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Total Balance",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppImages.fontPoppins,
                                        fontSize: 12.sp),
                                  )
                                ],
                              ),
                              Text(
                                "77548.0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontFamily: AppImages.fontPoppins,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )),
                          Container(height: 42, width: 1, color: Colors.white),
                          Container(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.total2),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Total Expense",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppImages.fontPoppins,
                                        fontSize: 12.sp),
                                  )
                                ],
                              ),
                              Text(
                                "-2750.0",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 24.sp,
                                    fontFamily: AppImages.fontPoppins,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ))
                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=> const AddCardScreen()));
                      },
                      child: Text(
                        "+ Add Card",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppImages.fontPoppins,
                            fontSize: 15.sp),
                      ))
                ],
              )),
          BlocConsumer<CardBloc , CardState>(
              builder: (BuildContext context ,CardState state){
                print("UZUNLIGI MANASHU ${state.cards.length}-------------------------");
                if(state.status == FormsSatus.succes){
                  print("UZUNLIGI MANASHU ${state.cards.length}-------------------------");
                  print("katta");
                  Container(
                    margin: EdgeInsets.only(
                      top: 250.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.r),
                          topLeft: Radius.circular(30.r),
                        ),
                        color: Colors.white),
                    child : Center(
                        child : Text("No cardvachhca ", style: TextStyle(
                            color : Colors.black,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppImages.fontPoppins
                        ),)
                    )
                  );
                }
                if(state.status == FormsSatus.error){
                  print("kichik");
                  return Container(
                      margin: EdgeInsets.only(
                        top: 250.h,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.r),
                            topLeft: Radius.circular(30.r),
                          ),
                          color: Colors.white),
                      child : Center(
                          child : Text("No cards 😐" , style: TextStyle(
                              color : Colors.black,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppImages.fontPoppins
                          ),)
                      )
                  );
                }
                print("olib ket");
                return Container(
                    margin: EdgeInsets.only(
                      top: 250.h,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.r),
                          topLeft: Radius.circular(30.r),
                        ),
                        color: Colors.white),
                    child : const Center(
                        child : CircularProgressIndicator(
                          color: AppColors.accentBlue,
                        )
                    )
                );
              }, listener: (BuildContext context, CardState state) {  },
          )
        ],
      ),
    );
  }
}
