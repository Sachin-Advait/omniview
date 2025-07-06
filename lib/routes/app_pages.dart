import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/global_keys.dart';
import 'package:omniview/data/models/user_model.dart';
import 'package:omniview/modules/chat_bot/page/chat_bot.dart';
import 'package:omniview/modules/login/bloc/login_bloc.dart';
import 'package:omniview/modules/login/page/login.dart';
import 'package:omniview/modules/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:omniview/modules/nav_bar/page/nav_bar.dart';
import 'package:omniview/modules/onboarding/cubit/onboarding_cubit.dart';
import 'package:omniview/modules/onboarding/page/onboarding.dart';
import 'package:omniview/modules/profile/view/profile.dart';
import 'package:omniview/modules/splash/bloc/splash_bloc.dart';
import 'package:omniview/modules/splash/page/splash.dart';
import 'package:omniview/routes/app_routes.dart';
import 'package:omniview/routes/default_route.dart';

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
        builder: (context, state) => BlocProvider(
          create: (context) => LoginBloc(),
          child: const Login(),
        ),
      ),
      GoRoute(
        path: Routes.navBar,
        name: Routes.navBar,
        builder: (context, state) => BlocProvider(
          create: (context) => NavBarCubit(),
          child: const NavBar(),
        ),
      ),
      GoRoute(
        path: Routes.chatBot,
        name: Routes.chatBot,
        builder: (context, state) => const ChatBot(),
      ),
      GoRoute(
        path: Routes.profile,
        name: Routes.profile,
        builder: (context, state) {
          final user = state.extra! as UserModel;
          return Profile(user: user);
        },
      ),
    ],
  );
}
