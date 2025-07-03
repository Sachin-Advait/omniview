import 'package:omniview/config/assets/app_svg.dart';

class OnboardingData {
  final String title;
  final String description;
  final String icon;

  OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final onboardingPages = [
  OnboardingData(
    title: 'Network Pulse',
    description:
        'See dropped-call ratio, data throughput, latency and 7 other critical KPIs in real time. OmniView turns raw network telemetry into clear, actionable insights—so you can fix issues before customers even notice.',
    icon: AppSvg.onboarding01,
  ),
  OnboardingData(
    title: 'Revenue Intelligence',
    description:
        'Unify billing, usage and subscriber data to track ARPU, roaming yield and revenue-leakage instantly. Every chart links finance back to network events, letting CXOs weigh profit impact at a glance.',
    icon: AppSvg.onboarding02,
  ),
  OnboardingData(
    title: 'Strategic Insights',
    description:
        'AI-powered forecasts simulate 5 G rollout, tariff tweaks and CAPEX plans. Align the entire leadership team around a data-backed roadmap that boosts market share and customer loyalty.',
    icon: AppSvg.onboarding03,
  ),
];
