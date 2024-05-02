import 'package:abu_pay/blocs/connectivity/connectivity_bloc.dart';
import 'package:abu_pay/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/auth/auth_bloc.dart';
import '../data/repository/auth_repository.dart';
import '../screens/route.dart';
import '../service/local_notification.dart';

class App extends StatelessWidget {
  App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    LocalNotificationService.localNotificationService.init(navigatorKey);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                AuthRepository(),
              ),
            ),
            BlocProvider(
              create: (context) => ConnectivityBloc(),
            )
          ],
          child: ScreenUtilInit(
            designSize: const Size(430, 932),
            builder: (context, child) {
              ScreenUtil.init(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: RouteNames.splashScreen,
                navigatorKey: navigatorKey,
                onGenerateRoute: AppRoutes.generateRoute,
              );
            },
            child: const SplashScreen(),
          )),
    );
  }
}
