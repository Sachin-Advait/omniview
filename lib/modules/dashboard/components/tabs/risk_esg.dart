import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/common/widgets/custom_bar_chart.dart';
import 'package:omniview/common/widgets/custom_line_chart.dart';

class RiskEsg extends StatelessWidget {
  const RiskEsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartCard(
          child: CustomLineChart(
            title: 'Risk Exposure Score ',
            minY: 60,
            maxY: 100,
            benchmarkY: 80,
            dataPoints: [
              FlSpot(0, 65),
              FlSpot(1, 76),
              FlSpot(2, 65),
              FlSpot(3, 98),
              FlSpot(4, 75),
              FlSpot(5, 70),
              FlSpot(6, 60),
            ],
          ),
        ),
        20.verticalSpace,

        ChartCard(
          child: CustomBarChart(
            title: 'ESG Compliance %',
            minY: 0,
            maxY: 100,
            benchmarkY: 65,
            values: [100, 96, 50, 70],
          ),
        ),
      ],
    );
  }
}
