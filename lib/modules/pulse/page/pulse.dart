import 'package:fl_chart/fl_chart.dart';
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
                Text(
                  'Revenue Achievement % - sudden drop',
                  style: context.medium.copyWith(fontSize: 16),
                ),

                20.verticalSpace,
                PulseLineChart(
                  interval: 10,
                  dataPoints: [
                    FlSpot(-5, 80),
                    FlSpot(0, 65),
                    FlSpot(10, 75),
                    FlSpot(20, 95),
                    FlSpot(30, 71),
                    FlSpot(40, 85),
                    FlSpot(50, 79),
                    FlSpot(60, 69),
                    FlSpot(65, 69),
                  ],
                ),
              ],
            ),
          ),
          20.verticalSpace,
          ChartCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Revenue Achievement % - spike',
                  style: context.medium.copyWith(fontSize: 16),
                ),
                20.verticalSpace,
                PulseLineChart(
                  interval: 20,
                  spike: ExtraLinesData(
                    verticalLines: [
                      VerticalLine(
                        x: 55,
                        color: AppColors.deepRose,
                        dashArray: [7, 6],
                        strokeWidth: 2.5,
                      ),
                    ],
                  ),
                  dataPoints: [
                    FlSpot(-5, 50),
                    FlSpot(0, 59),
                    FlSpot(10, 55),
                    FlSpot(20, 65),
                    FlSpot(30, 61),
                    FlSpot(40, 65),
                    FlSpot(50, 69),
                    FlSpot(55, 87),
                    FlSpot(60, 55),
                    FlSpot(65, 69),
                  ],
                ),
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
