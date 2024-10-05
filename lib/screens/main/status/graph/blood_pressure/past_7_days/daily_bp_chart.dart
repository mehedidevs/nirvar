import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

import '../../../../../../models/blood_pressure_last_seven_days/blood_pressure_history_for_last_7_days.dart';

class DailyBpChart extends StatefulWidget {
  final Map<String, BloodPressureSummary> apiResponse;
  final Color leftBarColor = AppColors.primary;
  final Color rightBarColor = AppColors.pale;
  final Color avgColor = Colors.green;

  const DailyBpChart({super.key, required this.apiResponse});

  @override
  State<DailyBpChart> createState() => _DailyBpChartState();
}

class _DailyBpChartState extends State<DailyBpChart> {

  final double width = 7;

  late List<BarChartGroupData> showingBarGroups;
  int touchedGroupIndex = -1;

  // Fetch the last 7 days
  List<String> getLast7Days() {
    List<String> last7Days = [];
    DateTime now = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime date = now.subtract(Duration(days: i));
      last7Days.add(DateFormat('yyyy-MM-dd').format(date));
    }
    return last7Days;
  }

  @override
  void initState() {
    super.initState();
    showingBarGroups = _buildBarGroups();
  }

  List<BarChartGroupData> _buildBarGroups() {
    final last7Days = getLast7Days();
    List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < last7Days.length; i++) {
      String date = last7Days[i];
      if (widget.apiResponse.containsKey(date)) {
        final BloodPressureSummary? summaryForDate = widget.apiResponse[date];

        // Ensure the summary exists and get systolic and diastolic values
        double systolic = (summaryForDate?.systolicAvg ?? 0).toDouble();
        double diastolic = (summaryForDate?.diastolicAvg ?? 0).toDouble();
        barGroups.add(makeGroupData(i, systolic, diastolic));
      } else {
        barGroups.add(makeGroupData(i, 0, 0));
      }
    }
    return barGroups.reversed.toList();
  }



  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          maxY: 200, // Adjust maxY for Systolic values
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.blueGrey,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String day = getLast7Days()[group.x.toInt()];
                // Get both systolic and diastolic values for the touched group
                double systolic = group.barRods[0].toY; // First rod represents Systolic
                double diastolic = group.barRods[1].toY; // Second rod represents Diastolic

                return BarTooltipItem(
                  'Date: $day\nSystolic: $systolic\nDiastolic: $diastolic',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                );
              },
            ),
            touchCallback: (FlTouchEvent event, response) {
              if (response == null || response.spot == null) {
                setState(() {
                  touchedGroupIndex = -1;
                });
                return;
              }
              touchedGroupIndex = response.spot!.touchedBarGroupIndex;
            },
          ),

          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitles,
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 40,
                getTitlesWidget: leftTitles,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: showingBarGroups,
          gridData: const FlGridData(show: false),
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
    final last7Days = getLast7Days();
    final Widget text = Text(
      DateFormat('dMMM').format(DateTime.parse(last7Days[value.toInt()])),
      style:  TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 10.sp,
        decoration: TextDecoration.none,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, // margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double systolic, double diastolic) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: systolic.toDouble(), // Systolic value
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: diastolic.toDouble(), // Diastolic value
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }
}
