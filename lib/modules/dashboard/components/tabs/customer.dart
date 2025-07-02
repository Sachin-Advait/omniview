import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/common/widgets/custom_bar_chart.dart';
import 'package:omniview/common/widgets/custom_line_chart.dart';

class Customer extends StatelessWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ChartCard(
            child: CustomLineChart(
              title: 'Market Share %',
              minY: 50,
              maxY: 100,
              benchmarkY: 80,
              dataPoints: [
                FlSpot(0, 80),
                FlSpot(1, 70),
                FlSpot(2, 90),
                FlSpot(3, 75),
                FlSpot(4, 95),
                FlSpot(5, 70),
                FlSpot(6, 60),
              ],
            ),
          ),
          20.verticalSpace,

          ChartCard(
            child: CustomBarChart(
              title: 'Free Cash Flow (\$M)',
              minY: 0,
              maxY: 100,
              benchmarkY: 65,
              values: [95, 80, 55, 80],
            ),
          ),
        ],
      ),
    );
  }
}
