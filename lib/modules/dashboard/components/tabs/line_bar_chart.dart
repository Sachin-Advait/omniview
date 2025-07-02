import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/common/widgets/custom_bar_chart.dart';
import 'package:omniview/common/widgets/custom_line_chart.dart';
import 'package:omniview/data/models/tab_model.dart';

class LineAndBarChart extends StatelessWidget {
  const LineAndBarChart({super.key, required this.tab});

  final TabModel tab;

  @override
  Widget build(BuildContext context) {
    final lineChart = tab.charts[0];

    final barChart = tab.charts[1];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ChartCard(
            child: CustomLineChart(
              title: lineChart.title,
              minY: lineChart.data.minY!.toDouble(),
              maxY: lineChart.data.maxY!.toDouble(),
              benchmarkY: lineChart.data.benchmarkY!.toDouble(),
              dataPoints: lineChart.data.dataPoints!
                  .map((pair) => FlSpot(pair[0].toDouble(), pair[1].toDouble()))
                  .toList(),
            ),
          ),

          20.verticalSpace,

          ChartCard(
            child: CustomBarChart(
              title: barChart.title,
              minY: barChart.data.minY!.toDouble(),
              maxY: barChart.data.maxY!.toDouble(),
              benchmarkY: barChart.data.benchmarkY!.toDouble(),
              values: barChart.data.values!.map((e) => e.toDouble()).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
