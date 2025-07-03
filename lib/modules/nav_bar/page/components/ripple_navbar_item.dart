import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';

class RippleNavbarItem extends StatefulWidget {
  const RippleNavbarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.showDot,
  });

  final Widget icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showDot;

  @override
  State<RippleNavbarItem> createState() => RippleNavbarItemState();
}

class RippleNavbarItemState extends State<RippleNavbarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rippleScale1;
  late Animation<double> _rippleOpacity1;
  late Animation<double> _rippleScale2;
  late Animation<double> _rippleOpacity2;

  bool _showPermanentRipples = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    // First ripple - starts immediately
    _rippleScale1 = Tween<double>(begin: 1.6, end: 2.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _rippleOpacity1 = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    // Second ripple - starts with delay
    _rippleScale2 = Tween<double>(begin: 1.6, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _rippleOpacity2 = Tween<double>(begin: 1, end: 0.9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward(from: 0.0); // Trigger the animation automatically
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showPermanentRipples = true;
        });
      }
    });
  }

  void _handleTap() {
    _controller.forward(from: 0.0);
    setState(() {
      _showPermanentRipples = true;
    });
    widget.onTap();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: SizedBox(
          width: 65,
          height: double.infinity,
          child: Stack(
            alignment: widget.isSelected && widget.showDot
                ? Alignment.topCenter
                : Alignment.center,
            children: [
              // Permanent ripple rings that stay after animation completes
              if (widget.showDot && _showPermanentRipples) ...[
                // Outer permanent ring
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0),
                      width: 4,
                    ),
                  ),
                ),
                // Inner permanent ring
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white.withValues(alpha: 0),
                      width: 4,
                    ),
                  ),
                ),
              ],

              // Animated ripples during tap
              if (widget.isSelected && !widget.showDot)
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => Stack(
                    alignment: Alignment.center,
                    children: [
                      // First ripple
                      if (_rippleOpacity1.value > 0)
                        Opacity(
                          opacity: _rippleOpacity1.value,
                          child: Transform.scale(
                            scale: _rippleScale1.value,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white.withValues(alpha: 0.4),
                              ),
                            ),
                          ),
                        ),
                      // Second ripple
                      if (_rippleOpacity2.value > 0)
                        Opacity(
                          opacity: _rippleOpacity2.value,
                          child: Transform.scale(
                            scale: _rippleScale2.value,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white.withValues(alpha: 0.3),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

              // Dot indicator
              if (widget.isSelected && widget.showDot)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  bottom: widget.isSelected ? 5 : null,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                ),
              // Icon LAST to stay fully visible
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                top: widget.isSelected && widget.showDot ? 5 : null,
                child: widget.icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
