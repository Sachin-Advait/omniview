import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/modules/insight/components/insight_12month.dart';
import 'package:omniview/modules/insight/components/insight_15day.dart';
import 'package:omniview/modules/insight/components/insight_6month.dart';

class Insight extends StatelessWidget {
  const Insight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Insight'),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          ChartCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Revenue Achievement % - 15-days forcast',
                  style: context.medium.copyWith(fontSize: 16),
                ),
                20.verticalSpace,
                Insight15day(),
              ],
            ),
          ),
          20.verticalSpace,
          ChartCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Revenue Achievement % - 12-month trend',
                  style: context.medium.copyWith(fontSize: 16),
                ),
                20.verticalSpace,
                Insight12month(),
              ],
            ),
          ),
          20.verticalSpace,
          ChartCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Revenue Achievement % - 6 months',
                  style: context.medium.copyWith(fontSize: 16),
                ),
                20.verticalSpace,
                Insight6month(),
              ],
            ),
          ),
          120.verticalSpace,
        ],
      ),
    );
  }
}
