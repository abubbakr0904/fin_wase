import 'package:abu_pay/blocs/user/user_bloc.dart';
import 'package:abu_pay/blocs/user/user_event.dart';
import 'package:abu_pay/data/local/storage_repository.dart';
import 'package:abu_pay/data/models/form_state/prile_form_state.dart';
import 'package:abu_pay/screens/auth/auth_screen/auth_screen.dart';
import 'package:abu_pay/screens/on_boarding/on_boarding_screen.dart';
import 'package:abu_pay/screens/route.dart';
import 'package:abu_pay/screens/tab_box/tab_box/tab_box.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/auth/auth_state.dart';
import '../../utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const TabBox1()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const AuthScreen()), (route) => false);
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
