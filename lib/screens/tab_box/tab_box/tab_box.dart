import 'package:abu_pay/screens/tab_box/profile_screen/profile_screen.dart';
import 'package:abu_pay/screens/tab_box/transaction/transaction.dart';
import 'package:abu_pay/utils/colors/app_colors.dart';
import 'package:abu_pay/utils/images/app_images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../blocs/user/user_event.dart';
import '../home_screen/home_screen.dart';

class TabBox1 extends StatefulWidget {
  const TabBox1({super.key});

  @override
  State<TabBox1> createState() => _TabBox1State();
}

class _TabBox1State extends State<TabBox1> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      const TransferScreen(),
      const HomeScreen(),
      const ProfileScreen(),
    ];

    BlocProvider.of<UserProfileBloc>(context).add(
        GetCurrentuser(uid: FirebaseAuth.instance.currentUser!.uid)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color : Colors.black
        ),
        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21.r),
                    color : AppColors.accentBlue
                ),
                child : Center(child: SvgPicture.asset(AppImages.homeIcon))
            ),
            icon: SvgPicture.asset(AppImages.homeIcon),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21.r),
                    color : AppColors.accentBlue
                ),
                child : Center(child: SvgPicture.asset(AppImages.arrows))
            ),
            icon: SvgPicture.asset(AppImages.arrows),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21.r),
                    color : AppColors.accentBlue
                ),
                child : Center(child: SvgPicture.asset(AppImages.layer))
            ),
            icon: SvgPicture.asset(AppImages.layer),
            label: "History",
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21.r),
                    color : AppColors.accentBlue
                ),
                child : Center(child: SvgPicture.asset(AppImages.profile))
            ),
            icon: SvgPicture.asset(AppImages.profile),
            label: "Profile",
          ),

        ],
      ),
    );
  }
}
