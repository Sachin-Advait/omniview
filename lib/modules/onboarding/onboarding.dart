import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/routes/routes.dart';

class OnboardingPageData {
  final String title;
  final String description;
  final IconData icon; // Or you can use AssetImage if you want

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final onboardingPages = [
  OnboardingPageData(
    title: 'Strategy',
    description:
        'Focused your plan designed to achieve specific goals. It includes defining objectives, market research, and aligning a roadmap to reach desired outcomes.',
    icon: Icons.dashboard_customize,
  ),
  OnboardingPageData(
    title: 'Finance',
    description:
        'Manage your money and assets, including budgeting, saving, investing, and retirement planning to achieve financial goals.',
    icon: Icons.analytics,
  ),
  OnboardingPageData(
    title: 'Analytics',
    description:
        'Analyzing data to uncover patterns, insights, and trends to support informed decision-making, improve performance, predict outcomes, and improve efficiency.',
    icon: Icons.start,
  ),
];

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex == onboardingPages.length - 1) {
      context.goNamed(Routes.login); // Change route as needed
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

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
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingPages.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              child: TextButton(
                onPressed: _nextPage,
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
                    _currentIndex == onboardingPages.length - 1
                        ? "Get Started"
                        : "Skip",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
