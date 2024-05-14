import 'package:abu_pay/blocs/card/card_bloc.dart';
import 'package:abu_pay/blocs/card/card_event.dart';
import 'package:abu_pay/blocs/connectivity/connectivity_bloc.dart';
import 'package:abu_pay/blocs/transactions/transaction_bloc.dart';
import 'package:abu_pay/blocs/user/user_bloc.dart';
import 'package:abu_pay/data/repository/card_repository.dart';
import 'package:abu_pay/data/repository/cards_repository.dart';
import 'package:abu_pay/data/repository/user_repository.dart';
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
        RepositoryProvider(
          create: (_) => CardReposritory(),
        ),
        RepositoryProvider(
          create: (_) => UserProfileRepo(),
        ),
        RepositoryProvider(
          create: (_) => TransactionBloc(cardsRepository: CardsRepository()),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AuthBloc(
                    AuthRepository(),
                  ),
            ),
            BlocProvider(
              create: (context) => ConnectivityBloc(),
            ),
            BlocProvider(
              create: (context) =>
                  UserProfileBloc(
                    context.read<UserProfileRepo>(),
                  ),
            ),
            BlocProvider(
              create: (context) =>
                  CardBloc(
                    CardReposritory(),
                  )..add(GetUserCards()),
            ),
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
