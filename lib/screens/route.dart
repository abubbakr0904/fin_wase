import 'package:abu_pay/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'auth/auth_screen/auth_screen.dart';
import 'on_boarding/on_boarding_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.tabRoute:
        return navigate(const SplashScreen());

      // case RouteNames.noInternetRoute:
      //   return navigate(NoInternetScreen(
      //       onInternetComeBack: settings.arguments as VoidCallback));
      //
      // case RouteNames.transferRoute:
      //   return navigate(const TransferScreen());
      // case RouteNames.paymentRoute:
      //   return navigate(const PaymentScreen());
      case RouteNames.authRoute:
        return navigate(const AuthScreen());
      case RouteNames.onBoardingRoute:
        return navigate(const OnBoardingScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String tabRoute = "/tab_route";
  static const String authRoute = "/auth_route";
  static const String noInternetRoute = "/no_internet_route";
  static const String paymentRoute = "/payment_route";
  static const String transferRoute = "/transfer_route";
  static const String onBoardingRoute = "/on_boarding_route";
}