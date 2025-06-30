import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/modules/dashboard/components/stat_card.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Dashboard'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatCard(
                  icon: Icons.attach_money,
                  title: 'Total Revenue',
                  subtitle: 'This Week',
                  value: '\$125,425',
                  color: AppColors.violet.withValues(alpha: .5),
                  trailing: Icon(Icons.show_chart, color: AppColors.primary),
                ),
                10.horizontalSpace,
                StatCard(
                  icon: Icons.groups,
                  title: 'Customers',
                  subtitle: 'This Week',
                  value: '415',
                  color: AppColors.royalBlue.withValues(alpha: .5),
                  trailing: Icon(Icons.show_chart, color: AppColors.royalBlue),
                ),
                10.horizontalSpace,
                StatCard(
                  icon: Icons.attach_money,
                  title: 'Avg. Sale',
                  subtitle: 'This Week',
                  value: '\$1,235',
                  color: AppColors.softOrange.withValues(alpha: .5),
                  trailing: Icon(Icons.show_chart, color: AppColors.softOrange),
                ),
              ],
            ),
          ),
          20.verticalSpace,
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
                      'Payment Statics',
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
                      titlesData: FlTitlesData(
                        rightTitles: AxisTitles(),
                        topTitles: AxisTitles(),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, _) {
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
                                  color: Colors.white54,
                                  fontSize: 12,
                                ),
                              );
                            },
                            interval: 1,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 100,
                            getTitlesWidget: (value, _) => Text(
                              '${value.toInt()}',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 500,
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          gradient: LinearGradient(
                            colors: [Color(0xFF8B6CFF), Color(0xFF00B2FF)],
                          ),
                          dotData: FlDotData(
                            show: true,
                            checkToShowDot: (spot, _) => spot.x == 5,
                            getDotPainter: (spot, _, __, ___) =>
                                FlDotCirclePainter(
                                  radius: 6,
                                  color: Colors.white,
                                  strokeWidth: 2,
                                  strokeColor: Color(0xFF8B6CFF),
                                ),
                          ),
                          belowBarData: BarAreaData(show: false),
                          spots: [
                            FlSpot(0, 50),
                            FlSpot(1, 100),
                            FlSpot(2, 150),
                            FlSpot(3, 130),
                            FlSpot(4, 200),
                            FlSpot(5, 400),
                            FlSpot(6, 450),
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
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.darkSlate,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        'Invoice Statics',
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
                ),
                invoiceItem("Paid", 738, 0.2, Color(0xFFB28BFF)),
                invoiceItem("Drafted", 4787, 0.9, Color(0xFF5F79FF)),
                invoiceItem("Partially Paid", 150, 0.3, Color(0xFFFFAE42)),
                invoiceItem("Overdue", 645, 0.6, Color(0xFFFF6B6B)),
              ],
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  Widget invoiceItem(String title, double amount, double percent, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: Colors.white70)),
              Text(
                '\$${amount.toInt()}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          LinearPercentIndicator(
            lineHeight: 6,
            padding: EdgeInsets.zero,
            percent: percent,

            progressColor: color,
            backgroundColor: color.withValues(alpha: .5),
            barRadius: const Radius.circular(20),
          ),
        ],
      ),
    );
  }
}
