import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/modules/pulse/components/pulse_bar_chart.dart';
import 'package:omniview/modules/pulse/components/pulse_line_chart.dart';

class Pulse extends StatelessWidget {
  const Pulse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pulse'),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          ChartCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Revenue Achievement % - \nsudden drop  -',
                      style: context.medium.copyWith(fontSize: 16),
                    ),
                    6.horizontalSpace,
                    Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: AppColors.royalBlue,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Revenue Achievement % - spike - ',
                      style: context.medium.copyWith(fontSize: 16),
                    ),
                    6.horizontalSpace,
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: AppColors.rosePink,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                PulseLineChart(),
              ],
            ),
          ),
          20.verticalSpace,
          ChartCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Revenue Achievement % - 5-min aggregation',
                  style: context.medium.copyWith(fontSize: 16),
                ),
                20.verticalSpace,
                PulseBarChart(),
              ],
            ),
          ),
          120.verticalSpace,
        ],
      ),
    );
  }
}
