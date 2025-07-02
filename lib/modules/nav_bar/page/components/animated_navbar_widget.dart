import 'package:flutter/material.dart';
import 'package:omniview/modules/nav_bar/page/components/ripple_navbar_item.dart';

class AnimatedNavbarWidget extends StatelessWidget {
  const AnimatedNavbarWidget({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    this.backgroundColor = Colors.white,
    this.showDotIndicator = true,
    this.ripple = false,
  });

  final List<NavbarItemData> items;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final Color backgroundColor;
  final bool showDotIndicator;
  final bool ripple;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == selectedIndex;
          return RippleNavbarItem(
            icon: item.icon,
            isSelected: isSelected,
            showDot: showDotIndicator,
            onTap: () => onItemSelected(index),
          );
        }),
      ),
    );
  }
}

class NavbarItemData {
  final Widget icon;

  const NavbarItemData({required this.icon});
}
