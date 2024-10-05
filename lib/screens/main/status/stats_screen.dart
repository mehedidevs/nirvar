import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';
import 'package:nirvar/screens/main/status/graph/blood_glucose/blood_glucose_bottom_sheet.dart';
import 'package:nirvar/screens/utils/app_colors.dart';
import 'package:nirvar/screens/widgets/custom_chasing_dots.dart';

import '../../../injection_container.dart';
import '../../../models/patient_blood_pressure/patient_blood_pressure.dart';
import '../../../repository/authentication/auth_repository.dart';
import '../../notification/notification_screen.dart';
import '../../utils/assets_path.dart';
import '../../utils/blood_pressure_utils.dart';
import 'components/blood_pressure_widget.dart';
import 'components/health_card_widget.dart';
import 'components/report_item.dart';
import 'graph/blood_pressure/blood_pressure_bottom_sheet.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                _headerSection(context),
                SizedBox(height: 16.h),
                InkWell(
                    onTap: _showBpGraph,
                    child: _getBloodPressureAvg(),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const BloodGlucoseBottomSheet(),
                        );
                      },
                      child: _getDiabetesAvg(),
                    ),
                    _getUserWeight(),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'Latest Report',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                _getLatestUploadedFiles(),
                SizedBox(height: ScreenUtil().screenHeight * .2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLatestUploadedFiles() {

    final repository = sl<PatientFileRepository>();
    return FutureBuilder(
        future: repository.getLatestUploadedFiles(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CustomChasingDots();
          }

          if(snapshot.hasData){
            return snapshot.data!.fold(
                    (failure){
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 8.w),
                    child: Center(child: Text(failure.message,style: const TextStyle(color: AppColors.primary),)),
                  );
            }, (success){
              if (success.isEmpty) {
                return const Center(child: Text('No File is Uploaded Recently',style: TextStyle(color: AppColors.primary),)); // Handle empty list
              }
              return ReportListView(
                reports: success,
                onRenameSuccess: ()async{setState(() {});},
                onDeleteSuccess: ()async{setState(() {});},
              );
            });
          }

          return const Center(child: Text('Something went wrong'));
        });
  }

  Widget _getUserWeight() {
    final authRepository = sl<AuthRepository>();
    return FutureBuilder(
      future: authRepository.getUserProfile(),
      builder: (context,snapshot){

        String weightValue = 'N/A';
        String weightUnit = '';

        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildHealthCardOfWeight(weightValue, weightUnit);
        }

        if (!snapshot.hasData) {
        return _buildHealthCardOfWeight(weightValue, weightUnit);
        }

        return snapshot.data!.fold((error){
          return _buildHealthCardOfWeight(weightValue, weightUnit);
        }, (success){
          if(success.photo == null || success.photo!.isEmpty){
             return _buildHealthCardOfWeight(weightValue, weightUnit);
          }else{
            return HealthCardWidget(
              backgroundColor: AppColors.yellowLight,
              title: 'Weight',
              value: success.weight?.toString() ?? "N/A",
              svgPath: AssetsPath.weightSvg,
              unit: 'kg',
            );
          }
        });
      },);
  }

  Widget _buildHealthCardOfWeight(String value, String unit) {
    return HealthCardWidget(
      backgroundColor: AppColors.yellowLight,
      title: 'Weight',
      value: value,
      svgPath: AssetsPath.weightSvg,
      unit: unit,
    );
  }

  Widget _getDiabetesAvg() {
    final patientGlucoseRepository = sl<DiabetesRepository>();
    return FutureBuilder(
    future: patientGlucoseRepository.getBloodGlucoseOfToday(),
    builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return _buildHealthCardWidgetOfDiabetes('N/A','Avg.');
      }
      if (!snapshot.hasData) {
        return _buildHealthCardWidgetOfDiabetes('N/A','Avg.');
      }
      return snapshot.data!.fold((error){
        return _buildHealthCardWidgetOfDiabetes('N/A','Avg.');
      }, (success){
        String minimumLevel = success ;
        return _buildHealthCardWidgetOfDiabetes(minimumLevel,'Avg.');
      });

    },);
  }

  Widget _buildHealthCardWidgetOfDiabetes(String value,String unit) {
    return HealthCardWidget(
                    backgroundColor: AppColors.purpleLight,
                    title: 'Diabetes',
                    value: value,
                    svgPath: AssetsPath.bloodDropSvg,
                    unit: unit,
                  );
  }

  Widget _getBloodPressureAvg() {
    final repository = sl<BloodPressureRepository>();
    List<PatientBloodPressure> bloodPressureList = [];
    String? systole;
    String? diastole;

    return FutureBuilder(future: repository.getBloodPressureOfToday(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildBloodPressureWidget('');
          }

          if (!snapshot.hasData) {
            return _buildBloodPressureWidget('N/A');
          }

          return snapshot.data!.fold(
                (error){
                  return _buildBloodPressureWidget('N/A');
            },
                (success){
              bloodPressureList = success;
              if(bloodPressureList.isEmpty){
                return _buildBloodPressureWidget('N/A');
              }else{
                final average = BloodPressureUtils.calculateAverage(bloodPressureList);
                systole = average['systolic']?.toStringAsFixed(0);
                diastole  = average['diastolic']?.toStringAsFixed(0);
                return _buildBloodPressureWidget('$systole/$diastole');
              }
            },);
    });
  }

  Widget _buildBloodPressureWidget(String message) => BloodPressureWidget(bloodPressure: message);

  void _showBpGraph() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const BloodPressureBottomSheet(),
    );
  }
}

Widget _headerSection(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'My Health',
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: AppColors.black),
        textAlign: TextAlign.center,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const NotificationScreen(hasNotification: false),
            ),
          );
        },
        child: SvgPicture.asset(AssetsPath.notificationWithBadgeSvg),
      ),
    ],
  );
}
