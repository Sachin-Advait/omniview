library;

import 'package:flutter/material.dart';

/// A Widget that displays a Bottom Navigation Bar with smooth animation.
/// It is a wrapper around [BottomNavigationBar].
class AnimatedNavbar extends StatelessWidget {
  AnimatedNavbar({
    super.key,
    this.selectedIndex = 0,
    this.height = 60,
    this.showElevation = true,
    this.iconSize = 20,
    this.backgroundColor,
    this.showDotIndicator = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.shadows = const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 3,
      ),
    ],
    required this.items,
    required this.onItemSelected,
  }) {
    // assert(height >= 55 && height <= 100);
    assert(items.length >= 2 && items.length <= 5);
    assert(iconSize >= 15 && iconSize <= 50);
  }

  final bool showDotIndicator;
  final Curve animationCurve;
  final Duration animationDuration;
  final Color? backgroundColor;
  final double height;
  final double iconSize;
  final List<AnimatedNavbarItem> items;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;
  final List<BoxShadow> shadows;
  final bool showElevation;

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ??
        Theme.of(context).bottomAppBarTheme.color ??
        Colors.white;

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: bg,
        boxShadow: showElevation ? shadows : [],
      ),
      child: Container(
        width: double.infinity,
        height: height + iconSizeEffectCalculator(iconSize),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            final index = items.indexOf(item);
            return Expanded(
              child: _AnimatedNavbarItem(
                item: item,
                isSelected: index == selectedIndex,
                onTap: () => onItemSelected(index),
                showDotIndicator: showDotIndicator,
                backgroundColor: bg,
                iconSize: iconSize,
                animationDuration: animationDuration,
                animationCurve: animationCurve,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  double iconSizeEffectCalculator(double size) {
    return size > 30
        ? size * 1.2
        : size > 10
            ? size * 0.6
            : 0;
  }
}

/// Represents each item (tab) in the navbar.
class AnimatedNavbarItem {
  AnimatedNavbarItem({
    required this.icon,
    this.activeColor = const Color(0xff272e81),
    this.inactiveColor = const Color(0xff9496c1),
    this.enableAnimation = true,
    this.onTap,
  });

  final Widget icon;
  final Color activeColor;
  final Color inactiveColor;
  final bool enableAnimation;
  final Function()? onTap;
}

class _AnimatedNavbarItem extends StatefulWidget {
  const _AnimatedNavbarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.showDotIndicator,
    required this.backgroundColor,
    required this.animationDuration,
    required this.animationCurve,
    required this.iconSize,
  });

  final AnimatedNavbarItem item;
  final bool isSelected;
  final Function() onTap;
  final bool showDotIndicator;
  final Color backgroundColor;
  final Duration animationDuration;
  final Curve animationCurve;
  final double iconSize;

  @override
  State<_AnimatedNavbarItem> createState() => _AnimatedNavbarItemState();
}

class _AnimatedNavbarItemState extends State<_AnimatedNavbarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve,
    );

    if (widget.isSelected) _controller.forward();
  }

  @override
  void didUpdateWidget(covariant _AnimatedNavbarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.item.onTap ?? widget.onTap,
      child: Container(
        alignment: Alignment.center,
        color: widget.backgroundColor,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Static unselected icon
            if (!widget.isSelected)
              IconTheme(
                data: IconThemeData(
                  size: widget.iconSize,
                  color: widget.item.inactiveColor,
                ),
                child: widget.item.icon,
              ),

            // Fade-in selected icon
            if (widget.isSelected)
              Padding(
                padding:
                    EdgeInsets.only(bottom: widget.showDotIndicator ? 12 : 0),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: IconTheme(
                    data: IconThemeData(
                      size: widget.iconSize,
                      color: widget.item.activeColor,
                    ),
                    child: widget.item.icon,
                  ),
                ),
              ),

            // Optional dot indicator
            if (widget.showDotIndicator)
              FadeTransition(
                opacity: _fadeAnimation,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.only(top: 32),
                    decoration: BoxDecoration(
                      color: widget.item.activeColor,
                      borderRadius: BorderRadius.circular(2.5),
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
