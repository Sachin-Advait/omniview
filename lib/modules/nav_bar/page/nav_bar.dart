import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omniview/modules/chat_bot/page/chat_bot.dart';
import 'package:omniview/modules/dashboard/page/dashborad.dart';
import 'package:omniview/modules/insight/page/insight.dart';
import 'package:omniview/modules/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:omniview/modules/nav_bar/page/components/nav_bar_content.dart';
import 'package:omniview/modules/pulse/page/pulse.dart';
import 'package:omniview/modules/setting/page/setting.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  final List<Widget> navBarItems = const [
    Pulse(),
    Insight(),
    Dashboard(),
    ChatBot(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.read<NavBarCubit>().goBack();
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BlocBuilder<NavBarCubit, int>(
              builder: (context, selectedIndex) {
                return navBarItems[selectedIndex];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NavBarContent(),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.only(bottom: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
