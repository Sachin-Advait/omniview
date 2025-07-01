import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/modules/dashboard/components/stat_builder.dart';
import 'package:omniview/modules/dashboard/components/tab_item.dart';
import 'package:omniview/modules/dashboard/components/tabs/customer.dart';
import 'package:omniview/modules/dashboard/components/tabs/growth.dart';
import 'package:omniview/modules/dashboard/components/tabs/people.dart';
import 'package:omniview/modules/dashboard/components/tabs/profit.dart';
import 'package:omniview/modules/dashboard/components/tabs/risk_esg.dart';

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
        body: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColors.primary.withValues(alpha: .2),
                ),
                child: const TabBar(
                  dividerHeight: 0,
                  indicatorWeight: 0,
                  indicatorPadding: EdgeInsetsGeometry.zero,
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(title: 'Growth'),
                    TabItem(title: 'Profit'),
                    TabItem(title: 'Customer'),
                    TabItem(title: 'People'),
                    TabItem(title: 'Risk & Esg'),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                children: const [
                  _TabContent(child: Growth()),
                  _TabContent(child: Profit()),
                  _TabContent(child: Customer()),
                  _TabContent(child: People()),
                  _TabContent(child: RiskEsg()),
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        20.verticalSpace,
        StatBuilder(),
        20.verticalSpace,
        child,
        20.verticalSpace,
      ],
    );
  }
}
