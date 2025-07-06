import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/common/widgets/purple_button.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/data/source/local/session_manager.dart';
import 'package:omniview/modules/onboarding/components/onboarding_data.dart';
import 'package:omniview/modules/onboarding/cubit/onboarding_cubit.dart';
import 'package:omniview/routes/app_routes.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController pageController;
  final Map<String, Widget> _svgCache = {};

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _buildSvgCache();
  }

  void _buildSvgCache() {
    // Cache SVG widgets to avoid rebuilding them
    for (final page in onboardingPages) {
      _svgCache[page.icon] = RepaintBoundary(
        child: SvgPicture.asset(page.icon, height: 400, fit: BoxFit.contain),
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingPages.length,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                context.read<OnboardingCubit>().setPage(index);
              },
              itemBuilder: (context, index) {
                return _OnboardingPage(
                  page: onboardingPages[index],
                  index: index,
                );
              },
            ),
          ),
          _NavigationButton(
            pageController: pageController,
            totalPages: onboardingPages.length,
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

// Separate widget to prevent unnecessary rebuilds
class _OnboardingPage extends StatelessWidget {
  final OnboardingData page;
  final int index;

  const _OnboardingPage({required this.page, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Use RepaintBoundary to optimize SVG rendering
          RepaintBoundary(
            child: SvgPicture.asset(
              page.icon,
              height: 400,
              placeholderBuilder: (context) => SizedBox(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            page.title,
            style: context.semiBold.copyWith(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: context.regular.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final PageController pageController;
  final int totalPages;

  const _NavigationButton({
    required this.pageController,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, currentPage) {
        final cubit = context.read<OnboardingCubit>();
        final isLast = cubit.isLastPage(totalPages);

        return PurpleButton(
          width: 150.widthMultiplier,
          onPressed: () => _handleButtonPress(context, cubit, isLast),
          title: currentPage == 0 ? "Get Started" : "Skip",
        );
      },
    );
  }

  void _handleButtonPress(
    BuildContext context,
    OnboardingCubit cubit,
    bool isLast,
  ) {
    if (isLast) {
      context.goNamed(Routes.login);
      SessionManager.saveIsFirstTime(true);
    } else {
      final nextPage = cubit.state + 1;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }
}
