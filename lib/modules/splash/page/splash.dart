import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omniview/config/assets/app_images.dart';
import 'package:omniview/routes/Routes.dart';
import 'package:omniview/routes/pages.dart';

import '../bloc/splash_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (_, state) {
          switch (state) {
            case SplashInitial():
            // Do Nothing.
            case NavigateToOnboardingActionState():
              Pages.router.goNamed(Routes.onBoarding);
            case NavigateToLoginActionState():
              Pages.router.goNamed(Routes.login);
            case NavigateToDashboardActionState():
              Pages.router.goNamed(Routes.dashboard);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 200),
              child: Image.asset(AppImages.appLogo, height: 140),
            ),
            Spacer(),
            Image.asset(AppImages.splashEffect),
          ],
        ),
      ),
    );
  }
}
