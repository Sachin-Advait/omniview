import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/data/models/user_model.dart';
import 'package:omniview/data/source/local/session_manager.dart';
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
  late UserModel user;

  @override
  void initState() {
    user = SessionManager.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Dashboard'),
        body: Column(
          children: [
            StatBuilder(summary: user.summary),
            20.verticalSpace,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: AppColors.primary.withValues(alpha: .2),
              ),
              child: TabBar(
                physics: NeverScrollableScrollPhysics(),
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
                tabs: user.tabs.map((tab) => TabItem(title: tab.name)).toList(),
              ),
            ),
            1.verticalSpace,
            Expanded(
              child: TabBarView(
                children: [
                  _TabContent(child: LineAndBarChart(tab: user.tabs[0])),
                  _TabContent(child: PieAndDountChart(tab: user.tabs[1])),
                  _TabContent(child: LineAndBarChart(tab: user.tabs[2])),
                  _TabContent(child: PieAndDountChart(tab: user.tabs[3])),
                  _TabContent(child: LineAndBarChart(tab: user.tabs[4])),
                ],
              ),
            ),
          ],
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
