import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';

class TopGlowBackground extends StatelessWidget {
  final Widget child;

  const TopGlowBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -1.2), // Top center
          radius: 0.4,
          colors: [
            Color.fromARGB(255, 65, 30, 153), // Purple glow
            AppColors.deepNavy,
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
