import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/modules/onboarding/components/onboarding_data.dart';
import 'package:omniview/modules/onboarding/cubit/onboarding_cubit.dart';
import 'package:omniview/routes/routes.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<OnboardingCubit, int>(
              builder: (context, index) {
                return PageView.builder(
                  controller: pageController,
                  itemCount: onboardingPages.length,
                  onPageChanged: (index) {
                    context.read<OnboardingCubit>().setPage(index);
                  },
                  itemBuilder: (context, index) {
                    final page = onboardingPages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(page.icon, height: 400),
                          const SizedBox(height: 20),
                          Text(
                            page.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            page.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          BlocBuilder<OnboardingCubit, int>(
            builder: (context, index) {
              final cubit = context.read<OnboardingCubit>();
              final isLast = cubit.isLastPage(onboardingPages.length);

              return TextButton(
                onPressed: () {
                  if (isLast) {
                    context.goNamed(Routes.login);
                  } else {
                    cubit.nextPage(onboardingPages.length);
                    pageController.animateToPage(
                      cubit.state,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(240),
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    isLast ? "Get Started" : "Skip",
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
