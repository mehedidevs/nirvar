import 'package:dartz/dartz.dart' as dartz;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';
import 'package:nirvar/screens/main/status/graph/blood_glucose/blood_glucose_input.dart';
import 'package:nirvar/screens/main/status/graph/blood_glucose/monthly/monthly_glucose_chart.dart';
import 'package:nirvar/screens/main/status/graph/blood_glucose/past_7_days/daily_glucose_chart.dart';
import 'package:nirvar/screens/main/status/graph/blood_glucose/weekly/weekly_glucose_chart.dart';
import 'package:path/path.dart';

import '../../../../../core/resources/api_exception.dart';
import '../../../../../injection_container.dart';
import '../../../../../models/glucose_level_last_seven_days/glucose_level_for_past_seven_days.dart';
import '../../../../../models/glucose_level_monthly/blood_glucose_monthly.dart';
import '../../../../../models/glucose_level_weekly/blood_glucose_weekly.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widgets/circuler_add_button.dart';
import '../../../../widgets/custom_chasing_dots.dart';

class BloodGlucoseBottomSheet extends StatelessWidget {
  const BloodGlucoseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Padding(
        padding: EdgeInsets.fromLTRB(0,16.h,0,0),
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
                    _buildDailyView(),
                    _buildWeeklyView(),
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

  Widget _buildDailyView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Daily Progress',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 16.h),

          _getDailyGlucoseLevel(),
          SizedBox(height: 24.h),
          // Chart Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chart',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),

              Row(
                children: [
                  _buildLegendItem(AppColors.primary, 'Input1'),
                  SizedBox(width: 16.w), // Responsive space between legends
                  _buildLegendItem(AppColors.pale, 'Input2'),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),

          _getDailyGlucoseChart(),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
        SizedBox(width: 8.w), // Space between icon and text
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _getDailyGlucoseLevel() {
    final patientGlucoseRepository = sl<DiabetesRepository>();

    return FutureBuilder(
      future: patientGlucoseRepository.getBloodGlucoseOfToday(),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildGlucoseLevelWidget('');
        }
        if (!snapshot.hasData) {
          return _buildGlucoseLevelWidget('');
        }
        return snapshot.data!.fold((error){
          return _buildGlucoseLevelWidget('');
        }, (success){
          String minimumLevel = success ;
          return _buildGlucoseLevelWidget(minimumLevel);
        });

      },);

  }

  Widget _getDailyGlucoseChart() {
    final repository = sl<DiabetesRepository>();

    return FutureBuilder<dartz.Either<ApiException,GlucoseLevelForPastSevenDays>>(
      future: repository.getBloodGlucoseOfLast7Days(),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomChasingDots(size: 50.sp);
        }
        if (!snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
            child: Center(child: Text(snapshot.error.toString(),style: const TextStyle(color: AppColors.primary),)),
          );
        }

        return snapshot.data!.fold(
              (error){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
              child: Center(child: Text(snapshot.error.toString(),style: const TextStyle(color: AppColors.primary),)),
            );
          },
              (success){
            final Map<String, GlucoseValues> bloodPressureMap = success.data ?? {};
            final formattedMap = bloodPressureMap.map((key, value) => MapEntry("'$key'", value));
            print(formattedMap);
            return DailyGlucoseChart(apiResponse: bloodPressureMap);
          },);

      },
    );
  }

  Widget _buildGlucoseLevelWidget(String minimum) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildBPBox(
        'Average Glucose Level',
        minimum,
      ),
    ],
  );
  }

  Widget _buildWeeklyView() {
    // Return the view for the Week tab
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Weekly Progress',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 16.h),

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
          _getWeeklyGlucoseChart()
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
          Center(
            child: Text(
              'Monthly Progress',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Chart',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
          SizedBox(height: 16.h),
          _getMonthlyGlucoseChart()
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
              style: TextStyle(fontSize: 14.sp, color: AppColors.black),textAlign: TextAlign.center,),
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

 Widget _getWeeklyGlucoseChart() {
    final response = sl<DiabetesRepository>();
    return FutureBuilder(
        future: response.getBloodGlucoseWeekly(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CustomChasingDots(size: 50.sp);
          }

          if (!snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
              child: Center(child: Text(snapshot.error.toString(),style: const TextStyle(color: AppColors.primary),)),
            );
          }

          return snapshot.data!.fold(
                (error){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
                child: Center(child: Text(snapshot.error.toString(),style: const TextStyle(color: AppColors.primary),)),
              );
            },
                (success){
              final Map<String, WeekData> bloodPressureMap = success.data ?? {};
              print(bloodPressureMap);
              // final formattedMap = bloodPressureMap.map((key, value) => MapEntry("'$key'", value));
              // print(formattedMap);
              return WeeklyGlucoseChart(responseData: bloodPressureMap);
            },);

    },);
 }

 Widget _getMonthlyGlucoseChart() {
   final response = sl<DiabetesRepository>();
   return FutureBuilder(
     future: response.getBloodGlucoseMonthly(),
     builder: (context,snapshot){
       if (snapshot.connectionState == ConnectionState.waiting) {
         return CustomChasingDots(size: 50.sp);
       }

       if (!snapshot.hasData) {
         return Padding(
           padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
           child: Center(child: Text(snapshot.error.toString(),style: const TextStyle(color: AppColors.primary),)),
         );
       }

       return snapshot.data!.fold(
             (error){
           return Padding(
             padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
             child: Center(child: Text(snapshot.error.toString(),style: const TextStyle(color: AppColors.primary),)),
           );
         },
             (success){
           final Map<String, MonthData> bloodPressureMap = success.data ?? {};
           print(bloodPressureMap);
           // final formattedMap = bloodPressureMap.map((key, value) => MapEntry("'$key'", value));
           // print(formattedMap);
           return MonthlyGlucoseChart(responseData: bloodPressureMap);
         },);

     },);
 }




}
