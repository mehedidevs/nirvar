import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodPressureChart extends StatelessWidget {
  const BloodPressureChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: _getBarGroups(),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) {
              return Colors.grey;
            },
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                rod.toY.toString(),
                TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
      BarChartGroupData(x: 8, barRods: [
        BarChartRodData(
          toY: 120,
          color: const Color(0xFF6CB6BE),
          width: 16.w,
          borderRadius: BorderRadius.circular(4.r),
        ),
        BarChartRodData(
          toY: 180,
          color: const Color(0xFF6CB6BE).withOpacity(0.4),
          width: 16.w,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ]),
      BarChartGroupData(x: 10, barRods: [
        BarChartRodData(
          toY: 80,
          color: const Color(0xFF6CB6BE),
          width: 16.w,
          borderRadius: BorderRadius.circular(4.r),
        ),
        BarChartRodData(
          toY: 140,
          color: const Color(0xFF6CB6BE).withOpacity(0.4),
          width: 16.w,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ]),
      // Add more BarChartGroupData here for additional bars.
    ];
  }
}
