import 'package:abu_pay/screens/on_boarding/page1/page1_screen.dart';
import 'package:abu_pay/screens/on_boarding/page2/page2_screen.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/local/storage_repository.dart';
import '../route.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {},
              physics: const NeverScrollableScrollPhysics(),
              children: const [Page1Screen(), Page2Screen()],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accentBlue,
        onPressed: () {
          if (activeIndex == 1) {
            StorageRepository.setBool(
              key: "is_new_user",
              value: true,
            ).then(
              (value) {
                Navigator.pushReplacementNamed(context, RouteNames.authRoute);
              },
            );
          } else {
            activeIndex += 1;
            controller.animateToPage(
              activeIndex,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          }
        },
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 20.sp,
        ),
      ),
    );
  }
}
