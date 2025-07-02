import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/common/widgets/custom_bar_chart.dart';
import 'package:omniview/common/widgets/custom_line_chart.dart';

class Growth extends StatelessWidget {
  const Growth({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ChartCard(
            child: CustomLineChart(
              title: 'Enterprise Health Score',
              minY: 50,
              maxY: 100,
              benchmarkY: 80,
              dataPoints: [
                FlSpot(0, 70),
                FlSpot(1, 76),
                FlSpot(2, 65),
                FlSpot(3, 98),
                FlSpot(4, 55),
                FlSpot(5, 70),
                FlSpot(6, 60),
              ],
            ),
          ),
          20.verticalSpace,

          ChartCard(
            child: CustomBarChart(
              title: 'Revenue Achievement %',
              minY: 0,
              maxY: 100,
              benchmarkY: 65,
              values: [65, 58, 85, 70],
            ),
          ),
        ],
      ),
    );
  }
}
