import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/data/source/local/bloc/user_bloc.dart';
import 'package:omniview/modules/dashboard/components/stat_builder.dart';
import 'package:omniview/modules/dashboard/components/tab_item.dart';
import 'package:omniview/modules/dashboard/components/tabs/line_bar_chart.dart';
import 'package:omniview/modules/dashboard/components/tabs/pie_dount_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Dashboard'),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return Column(
                children: [
                  StatBuilder(),
                  20.verticalSpace,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: AppColors.primary.withValues(alpha: .2),
                    ),
                    child: TabBar(
                      dividerHeight: 0,
                      indicatorWeight: 0,
                      indicatorPadding: EdgeInsetsGeometry.zero,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black54,
                      tabs: state.user.tabs
                          .map((tab) => TabItem(title: tab.name))
                          .toList(),
                    ),
                  ),
                  1.verticalSpace,
                  Expanded(
                    child: TabBarView(
                      children: [
                        _TabContent(
                          child: LineAndBarChart(tab: state.user.tabs[0]),
                        ),
                        _TabContent(
                          child: PieAndDountChart(tab: state.user.tabs[1]),
                        ),
                        _TabContent(
                          child: LineAndBarChart(tab: state.user.tabs[2]),
                        ),
                        _TabContent(
                          child: PieAndDountChart(tab: state.user.tabs[3]),
                        ),
                        _TabContent(
                          child: LineAndBarChart(tab: state.user.tabs[4]),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

class _TabContent extends StatelessWidget {
  final Widget child;
  const _TabContent({required this.child});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [20.verticalSpace, child, 120.verticalSpace],
    );
  }
}
