import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/common/widgets/custom_bar_chart.dart';
import 'package:omniview/common/widgets/custom_line_chart.dart';
import 'package:omniview/data/models/chart_model.dart';
import 'package:omniview/data/models/tab_model.dart';

class LineAndBarChart extends StatelessWidget {
  const LineAndBarChart({super.key, required this.tab});

  final TabModel tab;

  @override
  Widget build(BuildContext context) {
    final lineChart = tab.charts[0];
    final lineData = lineChart.data as LineChartDataModel;

    final barChart = tab.charts[1];
    final barData = barChart.data as BarChartDataModel;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ChartCard(
            child: CustomLineChart(
              title: lineChart.title,
              minY: lineData.minY,
              maxY: lineData.maxY,
              benchmarkY: lineData.benchmarkY,
              dataPoints: lineData.dataPoints
                  .map((pair) => FlSpot(pair[0], pair[1]))
                  .toList(),
            ),
          ),

          20.verticalSpace,

          ChartCard(
            child: CustomBarChart(
              title: barChart.title,
              minY: barData.minY,
              maxY: barData.maxY,
              benchmarkY: barData.benchmarkY,
              values: barData.values,
            ),
          ),
        ],
      ),
    );
  }
}
