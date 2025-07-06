import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_images.dart';
import 'package:omniview/routes/app_pages.dart';
import 'package:omniview/routes/app_routes.dart';

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
              Pages.appRouter.goNamed(Routes.onBoarding);
            case NavigateToLoginActionState():
              Pages.appRouter.goNamed(Routes.login);
            case NavigateToDashboardActionState():
              Pages.appRouter.goNamed(Routes.navBar);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 110,
              child: Image.asset(AppImages.splashEffect),
            ),
            20.verticalSpace,
            Container(
              alignment: Alignment.center,
              child: Image.asset(AppImages.splashLogo, height: 140),
            ),
            Spacer(),
            Image.asset(AppImages.splashLoader),
          ],
        ),
      ),
    );
  }
}
