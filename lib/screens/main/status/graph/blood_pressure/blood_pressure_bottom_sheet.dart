import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvar/models/blood_pressure_weekly/blood_pressure_summary_weekly.dart';
import 'package:nirvar/screens/main/status/graph/blood_pressure/blood_pressure_input.dart';
import 'package:nirvar/screens/main/status/graph/blood_pressure/monthly/monthly_bp_chart.dart';
import 'package:nirvar/screens/main/status/graph/blood_pressure/past_7_days/daily_bp_chart.dart';
import 'package:nirvar/screens/main/status/graph/blood_pressure/weekly/weekly_bp_chart.dart';
import 'package:nirvar/screens/utils/app_colors.dart';

import '../../../../../core/resources/api_exception.dart';
import '../../../../../injection_container.dart';
import '../../../../../models/blood_pressure_last_seven_days/blood_pressure_history_for_last_7_days.dart';
import '../../../../../models/blood_pressure_monthly/blood_pressure_summary_monthly.dart';
import '../../../../../models/patient_blood_pressure/patient_blood_pressure.dart';
import '../../../../../repository/blood_pressure/blood_pressure_repository.dart';
import '../../../../utils/blood_pressure_utils.dart';
import '../../../../widgets/circuler_add_button.dart';
import '../../../../widgets/custom_chasing_dots.dart';

class BloodPressureBottomSheet extends StatelessWidget {
  const BloodPressureBottomSheet({Key? key}) : super(key: key);

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
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
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
                    text: 'Daily',
                  ),
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
          Text(
            'Today’s Average BP',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          _getAverageBpOfToday(),
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
          _buildBPChartDaily(),
        ],
      ),
    );
  }

  Widget _getAverageBpOfToday() {

    final patientBloodPressureRepository = sl<BloodPressureRepository>();
    List<PatientBloodPressure> bloodPressureList = [];
    String? systole;
    String? diastole;

    return FutureBuilder(future: patientBloodPressureRepository.getBloodPressureOfToday(), builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return _buildBloodPressureWidget(systolicValue: '', diastolicValue: '');
      }
      if (!snapshot.hasData) {
        return _buildBloodPressureWidget(systolicValue: 'N/A', diastolicValue: 'N/A');
      }

      return snapshot.data!.fold(
            (error){
              return _buildBloodPressureWidget(systolicValue: 'N/A', diastolicValue: 'N/A');
        },
            (success){
          bloodPressureList = success;
          if(bloodPressureList.isEmpty){
            return _buildBloodPressureWidget(systolicValue: 'N/A', diastolicValue: 'N/A');
          }else{
            final average = BloodPressureUtils.calculateAverage(bloodPressureList);
            systole = average['systolic']?.toStringAsFixed(0);
            diastole  = average['diastolic']?.toStringAsFixed(0);
            return _buildBloodPressureWidget(systolicValue: '$systole', diastolicValue: '$diastole',unit: 'mmHg');
          }
        },);
    });

  }


  Widget _buildBPChartDaily() {
    final repository = sl<BloodPressureRepository>();

    return StreamBuilder<dartz.Either<ApiException,BloodPressureHistoryForLast7Days>>(
      stream: repository.getBloodPressureOfLast7Days(),
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
                final Map<String, BloodPressureSummary> bloodPressureMap = success.data ?? {};
                final formattedMap = bloodPressureMap.map((key, value) => MapEntry("'$key'", value));
                print(formattedMap);
                return DailyBpChart(apiResponse: bloodPressureMap);
              },);

      },
    );
  }


  Widget _buildBloodPressureWidget({
    required String systolicValue,  // Required systolic value
    required String diastolicValue, // Required diastolic value
    String unit = '',               // Optional unit, defaulting to an empty string
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBPBox('SYS', systolicValue, unit), // Use the systolic value and unit
        _buildBPBox('DIA', diastolicValue, unit), // Use the diastolic value and unit
      ],
    );
  }


  Widget _buildWeeklyView() {
    final repository = sl<BloodPressureRepository>();

    return FutureBuilder<dartz.Either<ApiException,BloodPressureSummaryWeekly>>(
      future: repository.getBloodPressureWeekly(),
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
            final Map<String, BloodPressureWeek> bloodPressureMap = success.data ?? {};
            print(bloodPressureMap);
            //  final formattedMap = bloodPressureMap.map((key, value) => MapEntry("'$key'", value));
            // print(formattedMap);
            return WeeklyBpChart(data: bloodPressureMap);
          },);

      },
    );
  }

  Widget _buildMonthView() {
    final repository = sl<BloodPressureRepository>();

    return FutureBuilder<dartz.Either<ApiException,BloodPressureSummaryMonthly>>(
      future: repository.getBloodPressureMonthly(),
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
            final Map<String, BloodPressureMonth> bloodPressureMap = success.data ?? {};
            // final formattedMap = bloodPressureMap.map((key, value) => MapEntry("'$key'", value));
            // print(formattedMap);
            print(bloodPressureMap);
            return MonthlyBpChart(data: bloodPressureMap);
          },);

      },
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


}
