import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/global_keys.dart';
import 'package:omniview/modules/dashboard/components/nav_bar.dart';
import 'package:omniview/modules/login/page/login.dart';
import 'package:omniview/modules/onboarding/cubit/onboarding_cubit.dart';
import 'package:omniview/modules/onboarding/page/onboarding.dart';
import 'package:omniview/modules/splash/bloc/splash_bloc.dart';
import 'package:omniview/modules/splash/page/splash.dart';
import 'package:omniview/routes/default_route.dart';
import 'package:omniview/routes/routes.dart';

class Pages {
  static GoRouter get appRouter => _appRouter;

  static final GoRouter _appRouter = GoRouter(
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
        builder: (context, state) => BlocProvider(
          create: (_) => OnboardingCubit(),
          child: const Onboarding(),
        ),
      ),
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: Routes.dashboard,
        name: Routes.dashboard,
        builder: (context, state) => const NavBar(),
      ),
    ],
  );
}
