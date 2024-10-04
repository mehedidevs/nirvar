import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';
import 'package:nirvar/screens/main/status/graph/blood_glucose/blood_glucose_input.dart';

import '../../../../../injection_container.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widgets/circuler_add_button.dart';

class BloodGlucoseBottomSheet extends StatelessWidget {
  const BloodGlucoseBottomSheet({super.key});

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
                      InkWell(onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BloodGlucoseInput()));
                      }, child: circuler_add_button()),
                      SizedBox(width: 16.w),
                      Text(
                        'Blood Glucose',
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
                  Tab(text: 'Daily'),
                  Tab(text: 'Weekly'),
                  Tab(text: 'Monthly'),
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
            'Today’s Progress',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          _getDailyGlucoseLevel(),
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

  Widget _getDailyGlucoseLevel() {
    final patientGlucoseRepository = sl<DiabetesRepository>();

    return FutureBuilder(
      future: patientGlucoseRepository.getBloodGlucoseOfToday(),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildGlucoseLevelWidget('','');
        }
        if (!snapshot.hasData) {
          return _buildGlucoseLevelWidget('','');
        }
        return snapshot.data!.fold((error){
          return _buildGlucoseLevelWidget('','');
        }, (success){
          double maximumLevel = double.tryParse(success.maximum ?? '0') ?? 0.0;
          double minimumLevel = double.tryParse(success.minimum ?? '0') ?? 0.0;
          return _buildGlucoseLevelWidget('$minimumLevel','$maximumLevel');
        });

      },);

  }

  Row _buildGlucoseLevelWidget(String minimum,String maximum) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildBPBox(
        'Minimum',
        minimum,
      ),
      _buildBPBox(
        'Maximum',
        maximum,
      ),
    ],
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
            'Week’s Progress',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBPBox(
                'Minimum',
                '6.1'
              ),
              _buildBPBox('Maximum', '13.2'),
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
            'Month’s Progress',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBPBox('Minimum', '6.2'),
              _buildBPBox('Maximum', '12.5'),
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

  Widget _buildBPBox(String label, String value) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: TextStyle(fontSize: 14.sp, color: AppColors.black)),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 32.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
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
