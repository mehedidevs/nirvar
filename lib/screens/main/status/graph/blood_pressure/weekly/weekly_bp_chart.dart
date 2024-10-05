import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../models/blood_pressure_weekly/blood_pressure_summary_weekly.dart';
import '../../../../../utils/app_colors.dart';

class WeeklyBpChart extends StatelessWidget {
  final Map<String, BloodPressureWeek> data;

  const WeeklyBpChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 180,
            minY: 0,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  String week = data.keys.toList()[group.x.toInt()];
                  var systolic = data[week]?.avgSystolic ?? 'N/A';
                  var diastolic = data[week]?.avgDiastolic ?? 'N/A';
                  var category = data[week]?.category ?? 'N/A';

                 return BarTooltipItem(
                    '$week\n',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Systolic: $systolic\n',
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: 'Diastolic: $diastolic\n',
                        style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: 'Status: $category',
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  );

                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 42,
                  interval: 20,
                  getTitlesWidget: leftTitles,
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 42,
                  getTitlesWidget: bottomTitles,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: _generateBarGroups(),
            gridData: const FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;
      case 100:
        text = '100';
        break;
      case 120:
        text = '120';
        break;
      case 140:
        text = '140';
        break;
      case 160:
        text = '160';
        break;
      case 180:
        text = '180';
        break;
      case 200:
        text = '200';
        break;
      default:
        return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style:  TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 10.sp,
        decoration: TextDecoration.none,
      )),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {

    Widget text;
    switch (value.toInt()) {
      case 0:
        text =  Text('Week 1', style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
          decoration: TextDecoration.none,
        ));
        break;
      case 1:
        text =  Text('Week 2', style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
          decoration: TextDecoration.none,
        ));
        break;
      case 2:
        text =  Text('Week 3', style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
          decoration: TextDecoration.none,
        ));
        break;
      case 3:
        text =  Text('Week 4', style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
          decoration: TextDecoration.none,
        ));
        break;
      default:
        text =  Text(' ', style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
          decoration: TextDecoration.none,
        ));
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    List<BarChartGroupData> barGroups = [];
    List<String> weeks = data.keys.toList();

    for (int i = 0; i < weeks.length; i++) {
      var weekData = data[weeks[i]];
      double systolic = double.tryParse(weekData?.avgSystolic ?? '0') ?? 0;
      double diastolic = double.tryParse(weekData?.avgDiastolic ?? '0') ?? 0;
      String category = weekData?.category ?? 'NA';

      Color systolicColor;
      Color diastolicColor;

      // Set color based on category
      if (category == 'High' || category == 'Low') {
        systolicColor = Colors.redAccent;
        diastolicColor = Colors.redAccent;
      } else {
        systolicColor = AppColors.primary; // Systolic Normal
        diastolicColor = AppColors.pale; // Diastolic Normal
      }

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(toY: systolic, color: systolicColor, width: 10),
            BarChartRodData(toY: diastolic, color: diastolicColor, width: 10),
          ],
        ),
      );
    }

    return barGroups;
  }
}
