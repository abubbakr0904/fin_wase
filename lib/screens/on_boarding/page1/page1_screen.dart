import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:abu_pay/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Page1Screen extends StatefulWidget {
  const Page1Screen({super.key});

  @override
  State<Page1Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 123.h , horizontal: 40.w),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color : AppCOlors.accentBlue,
          child : Text("Welcome to Expense Manager" , style: TextStyle(
            color : Colors.black,
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
            fontFamily: AppImages.fontPoppins
          ),
          textAlign: TextAlign.center,
          )
        ),
        Container(
          margin: EdgeInsets.only(top: 300.h),
          padding: EdgeInsets.symmetric(vertical: 40.w),
          decoration: BoxDecoration(
            color : Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.r),
              topLeft: Radius.circular(50.r),
            )
          ),
          child : Column(
            children: [
              Image.asset(AppImages.tanga , width: 287.w,height: 287.w,fit : BoxFit.cover),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 15.w,
                    height: 15.w,
                    decoration: BoxDecoration(
                      color : AppCOlors.accentBlue,
                      borderRadius: BorderRadius.circular(100.r)
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Container(
                    width: 15.w,
                    height: 15.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color : Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(100.r)
                    ),
                  ),
                ],
              )
            ],
          )
        )
      ],
    );
  }
}
