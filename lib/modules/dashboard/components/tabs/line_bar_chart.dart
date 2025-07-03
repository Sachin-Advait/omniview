import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/common/widgets/custom_bar_chart.dart';
import 'package:omniview/common/widgets/custom_line_chart.dart';
import 'package:omniview/data/models/tab_model.dart';

class LineAndBarChart extends StatefulWidget {
  const LineAndBarChart({super.key, required this.tab});

  final TabModel tab;

  @override
  State<LineAndBarChart> createState() => _LineAndBarChartState();
}

class _LineAndBarChartState extends State<LineAndBarChart> {
  List<double> animatedBarValues = [];
  double animationProgress = 0.0;

  @override
  void initState() {
    super.initState();

    final barChart = widget.tab.charts[1];
    animatedBarValues = List.filled(barChart.data.values!.length, 0);

    // Bar animation after short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        animatedBarValues = barChart.data.values!
            .map((e) => e.toDouble())
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final lineChart = widget.tab.charts[0];
    final barChart = widget.tab.charts[1];

    final originalLinePoints = lineChart.data.dataPoints!
        .map((pair) => FlSpot(pair[0].toDouble(), pair[1].toDouble()))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ChartCard(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                final visiblePoints = _interpolateLine(
                  originalLinePoints,
                  value,
                );
                return CustomLineChart(
                  title: lineChart.title,
                  minY: lineChart.data.minY!.toDouble(),
                  maxY: lineChart.data.maxY!.toDouble(),
                  benchmarkY: lineChart.data.benchmarkY!.toDouble(),
                  dataPoints: visiblePoints,
                );
              },
            ),
          ),
          20.verticalSpace,
          ChartCard(
            child: CustomBarChart(
              title: barChart.title,
              minY: barChart.data.minY!.toDouble(),
              maxY: barChart.data.maxY!.toDouble(),
              benchmarkY: barChart.data.benchmarkY!.toDouble(),
              values: animatedBarValues,
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _interpolateLine(List<FlSpot> allPoints, double progress) {
    if (progress <= 0) return [];
    if (progress >= 1) return allPoints;

    final maxX = allPoints.last.x;
    final cutoffX = maxX * progress;

    List<FlSpot> result = [];

    for (int i = 0; i < allPoints.length; i++) {
      final point = allPoints[i];
      if (point.x <= cutoffX) {
        result.add(point);
      } else if (i > 0) {
        final prev = allPoints[i - 1];
        final t = (cutoffX - prev.x) / (point.x - prev.x);
        final interpolatedY = prev.y + (point.y - prev.y) * t;
        result.add(FlSpot(cutoffX, interpolatedY));
        break;
      }
    }

    return result;
  }
}
