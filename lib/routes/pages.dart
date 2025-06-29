import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/global_keys.dart';
import 'package:omniview/modules/dashboard/dashboard.dart';
import 'package:omniview/modules/login/login.dart';
import 'package:omniview/modules/onboarding/onboarding.dart';
import 'package:omniview/modules/splash/bloc/splash_bloc.dart';
import 'package:omniview/modules/splash/page/splash.dart';
import 'package:omniview/routes/default_route.dart';
import 'package:omniview/routes/routes.dart';

class Pages {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    navigatorKey: GlobalKeys.navigatorKey,
    errorBuilder: (context, state) => DefaultRoute(),
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashBloc()..add(NavigateToNextEvent()),
          child: const Splash(),
        ),
      ),
      GoRoute(
        path: Routes.onBoarding,
        name: Routes.onBoarding,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: Routes.dashboard,
        name: Routes.dashboard,
        builder: (context, state) => const Dashboard(),
      ),
    ],
  );
}
