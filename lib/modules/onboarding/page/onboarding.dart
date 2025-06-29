import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF121833), Color(0xFF0C1026)],
          ),
        ),
        child: Column(
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
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(page.icon, size: 100, color: Colors.white),
                            const SizedBox(height: 40),
                            Text(
                              page.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              page.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
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

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 50,
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (isLast) {
                        context.goNamed(Routes.login);
                      } else {
                        cubit.nextPage(onboardingPages.length);
                        pageController.animateToPage(
                          cubit.state + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        isLast ? "Get Started" : "Skip",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
