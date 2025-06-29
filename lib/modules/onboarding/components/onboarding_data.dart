import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String description;
  final IconData icon;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final onboardingPages = [
  OnboardingData(
    title: 'Strategy',
    description:
        'Focused your plan designed to achieve specific goals. It includes defining objectives, market research, and aligning a roadmap to reach desired outcomes.',
    icon: Icons.dashboard_customize,
  ),
  OnboardingData(
    title: 'Finance',
    description:
        'Manage your money and assets, including budgeting, saving, investing, and retirement planning to achieve financial goals.',
    icon: Icons.analytics,
  ),
  OnboardingData(
    title: 'Analytics',
    description:
        'Analyzing data to uncover patterns, insights, and trends to support informed decision-making, improve performance, predict outcomes, and improve efficiency.',
    icon: Icons.start,
  ),
];
