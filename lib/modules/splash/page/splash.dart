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
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF121833), Color(0xFF0C1026)],
          ),
        ),
        child: BlocListener<SplashBloc, SplashState>(
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
            children: [
              Image.asset(AppImages.splashLogo, height: 440),
              Spacer(),
              Image.asset(
                AppImages.splashEffect,
                // height: 200,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
