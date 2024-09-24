import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nirvar/screens/main/status/graph/blood_pressure/blood_pressure_input.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

import '../../../../widgets/circuler_add_button.dart';

class BloodPressureBottomSheet extends StatelessWidget {
  const BloodPressureBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Padding(
        padding: EdgeInsets.fromLTRB(0,32.h,0,0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              2.verticalSpace,
              Center(
                child: Container(
                  height: 4.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BloodPressureInput()));
                          },
                          child: circuler_add_button()),
                      SizedBox(width: 16.w),
                      Text(
                        'Blood Pressure',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              // Tab Bar Section
              const TabBar(
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.grey,
                indicatorColor: AppColors.primary,
                tabs: [
                  Tab(
                    text: 'Day',
                  ),
                  Tab(text: 'Week'),
                  Tab(text: 'Month'),
                ],
              ),
              SizedBox(height: 16.h),
              // TabBarView Section
              Expanded(
                child: TabBarView(
                  children: [
                    _buildDayView(),
                    _buildWeekView(),
                    _buildMonthView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDayView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today’s Average BP',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBPBox('SYS', '144', 'mmHg'),
              _buildBPBox('DIA', '72', 'mmHg'),
            ],
          ),
          SizedBox(height: 24.h),
          // Chart Section
          Text(
            'Chart',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
          SizedBox(height: 16.h),
          _buildBPChart(),
        ],
      ),
    );
  }

  Widget _buildWeekView() {
    // Return the view for the Week tab
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Week’s Average BP',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBPBox('SYS', '144', 'mmHg'),
              _buildBPBox('DIA', '72', 'mmHg'),
            ],
          ),
          SizedBox(height: 24.h),
          // Chart Section
          Text(
            'Chart',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 16.h),
          _buildBPChart(),
        ],
      ),
    );
  }

  Widget _buildMonthView() {
    // Return the view for the Month tab
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Month’s Average BP',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBPBox('SYS', '144', 'mmHg'),
              _buildBPBox('DIA', '72', 'mmHg'),
            ],
          ),
          SizedBox(height: 24.h),
          // Chart Section
          Text(
            'Chart',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
          SizedBox(height: 16.h),
          _buildBPChart(),
        ],
      ),
    );
  }

  Widget _buildBPBox(String label, String value, String unit) {
    return Container(
      width: 0.42.sw,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 14.sp, color: AppColors.black)),
          SizedBox(height: 8.h),
          RichText(
            text: TextSpan(
              text: value,
              style: TextStyle(
                fontSize: 32.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: ' $unit',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBPChart() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 180,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
                x: 8,
                barRods: [BarChartRodData(toY: 120, color: AppColors.primary)]),
            BarChartGroupData(
                x: 10,
                barRods: [BarChartRodData(toY: 80, color: AppColors.primary)]),
            BarChartGroupData(
                x: 12,
                barRods: [BarChartRodData(toY: 100, color: AppColors.primary)]),
            BarChartGroupData(
                x: 14,
                barRods: [BarChartRodData(toY: 110, color: AppColors.primary)]),
            BarChartGroupData(
                x: 16,
                barRods: [BarChartRodData(toY: 60, color: AppColors.primary)]),
            BarChartGroupData(
                x: 18,
                barRods: [BarChartRodData(toY: 90, color: AppColors.primary)]),
            BarChartGroupData(
                x: 20,
                barRods: [BarChartRodData(toY: 130, color: AppColors.primary)]),
          ],
        ),
      ),
    );
  }
}
