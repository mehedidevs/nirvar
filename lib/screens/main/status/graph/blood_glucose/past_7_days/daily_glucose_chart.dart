import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../models/glucose_level_last_seven_days/glucose_level_for_past_seven_days.dart';
import '../../../../../utils/app_colors.dart';

class DailyGlucoseChart extends StatefulWidget {

  final Map<String, GlucoseValues> apiResponse;
  final Color leftBarColor = AppColors.primary;
  final Color rightBarColor = AppColors.softPeachy;
  final Color avgColor = Colors.green;

  const DailyGlucoseChart({super.key, required this.apiResponse});

  @override
  State<DailyGlucoseChart> createState() => _DailyGlucoseChartState();
}

class _DailyGlucoseChartState extends State<DailyGlucoseChart> {

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
        final GlucoseValues? summaryForDate = widget.apiResponse[date];

        // Ensure the summary exists and get systolic and diastolic values
        double valueOne = (summaryForDate?.valueOne ?? 0).toDouble();
        double valueTwo = (summaryForDate?.valueTwo ?? 0).toDouble();
        barGroups.add(makeGroupData(i, valueOne, valueTwo));
      } else {
        barGroups.add(makeGroupData(i, 0, 0));
      }
    }
    return barGroups.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16/9,

      child: BarChart(
        BarChartData(
          maxY: 40,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              fitInsideHorizontally: true,
              tooltipMargin: 4,
              tooltipPadding: const EdgeInsets.all(4),
              getTooltipColor: (_) => Colors.blueGrey,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                String day = getLast7Days()[group.x.toInt()];
                String valueToShow;
                if (rodIndex == 0) {
                  valueToShow = 'Before Meal: ${rod.toY.toString()}'; // For bar 1
                } else {
                  valueToShow = 'After Meal: ${rod.toY.toString()}'; // For bar 2
                }

                return BarTooltipItem(
                  '$day\n',
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    decoration: TextDecoration.none,
                    letterSpacing: 0.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$valueToShow\n',
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
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
                interval: 5,
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
      case 5:
        text = '5';
        break;
      case 10:
        text = '10';
        break;
      case 15:
        text = '15';
        break;
      case 20:
        text = '20';
        break;
      case 25:
        text = '25';
        break;
      case 30:
        text = '30';
        break;
      case 35:
        text = '35';
        break;
      case 40:
        text = '40';
        break;
      default:
        return Container(); // hide in-between ticks
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 10.sp,
          decoration: TextDecoration.none,
        ),
      ),
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

  BarChartGroupData makeGroupData(int x, double valueOne, double valueTwo) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: valueOne.toDouble(), // Systolic value
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: valueTwo.toDouble(), // Diastolic value
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

}
