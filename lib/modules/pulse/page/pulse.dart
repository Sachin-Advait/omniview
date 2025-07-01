import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.darkSlate,
              borderRadius: BorderRadius.circular(30),
            ),

            child: Column(
              children: [
                10.verticalSpace,

                Row(
                  children: [
                    Text(
                      'Revenue',
                      style: context.medium.copyWith(fontSize: 18),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.deepNavy,
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Weekly',
                        style: context.regular.copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                SizedBox(
                  height: 250,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) => Text(
                              '${value.toInt()}%',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                              ),
                            ),
                            interval: 5,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = [
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat',
                                'Sun',
                              ];
                              return Text(
                                days[value.toInt()],
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                              );
                            },
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      lineBarsData: [
                        // Credit line
                        LineChartBarData(
                          isCurved: true,
                          color: Colors.blueAccent,
                          dotData: FlDotData(show: true),
                          spots: [
                            FlSpot(0, 10),
                            FlSpot(1, 5),
                            FlSpot(2, 8),
                            FlSpot(3, 12),
                            FlSpot(4, 15),
                            FlSpot(5, 17),
                            FlSpot(6, 18),
                          ],
                        ),
                        // Debt line
                        LineChartBarData(
                          isCurved: true,
                          color: Colors.pinkAccent,
                          dotData: FlDotData(show: true),
                          spots: [
                            FlSpot(0, 5),
                            FlSpot(1, 6),
                            FlSpot(2, 8),
                            FlSpot(3, 10),
                            FlSpot(4, 5),
                            FlSpot(5, 4),
                            FlSpot(6, 3),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.darkSlate,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SLA', style: context.medium.copyWith(fontSize: 18)),
                20.verticalSpace,
                SizedBox(
                  height: 250,
                  child: BarChart(
                    BarChartData(
                      borderData: FlBorderData(show: false),
                      alignment: BarChartAlignment.spaceAround,
                      gridData: FlGridData(show: false),
                      barGroups: List.generate(7, (index) {
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: 100,
                              color: Colors.deepPurpleAccent,
                              width: 6,
                            ),
                            BarChartRodData(
                              toY: 120,
                              color: Colors.deepPurple.shade400,
                              width: 6,
                            ),
                          ],
                        );
                      }),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 25,
                            getTitlesWidget: (value, meta) => Text(
                              '${value.toInt()}',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.darkSlate,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Text('Status', style: context.medium.copyWith(fontSize: 18)),
                20.verticalSpace,
                Expanded(
                  child: PieChart(
                    PieChartData(
                      startDegreeOffset: 270,
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                      sections: [
                        PieChartSectionData(
                          value: 65,
                          color: Colors.deepPurpleAccent,
                          radius: 18,
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          value: 35,
                          color: Colors.orangeAccent,
                          radius: 18,
                          showTitle: false,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "\$35,903",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Total value",
                  style: TextStyle(color: Colors.white60, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
