import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/models/glucose_level_weekly/blood_glucose_weekly.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

class WeeklyGlucoseChart extends StatefulWidget {

  final Map<String, WeekData> responseData;
  final Color barBackgroundColor = Colors.white;
  final Color barColor = Colors.white;

  const WeeklyGlucoseChart({super.key, required this.responseData});


  @override
  State<WeeklyGlucoseChart> createState() => _WeeklyGlucoseChartState();
}

class _WeeklyGlucoseChartState extends State<WeeklyGlucoseChart> {

  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 16.h),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? barColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: barColor)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(4, (i) {
      final week = widget.responseData["Week ${i + 1}"];
      final avgLevel = week?.avgLevel ?? 0.0; // fallback to 0 if null
      final category = week?.category ?? 'N/A';

      // Determine bar color based on category
      final barColor = (category == "High" || category == "Low")
          ? Colors.redAccent
          : AppColors.primary;

      return makeGroupData(i, avgLevel, isTouched: i == touchedIndex, barColor: barColor);
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final week = widget.responseData["Week ${groupIndex + 1}"];
            final avgLevel = week?.avgLevel ?? 0.0;
            final category = week?.category ?? 'N/A';

            return BarTooltipItem(
              'Week ${group.x + 1}\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Avg Level: ${rod.toY}\n',
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: 'Category: $category',
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
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
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
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                  style:  TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    decoration: TextDecoration.none,
                  ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
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
}
