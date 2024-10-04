import 'package:dartz/dartz.dart';

import '../../core/resources/api_exception.dart';
import '../../models/blood_pressure_last_seven_days/blood_pressure_history_for_last_7_days.dart';
import '../../models/blood_pressure_monthly/blood_pressure_summary_monthly.dart';
import '../../models/blood_pressure_weekly/blood_pressure_summary_weekly.dart';
import '../../models/patient_blood_pressure/patient_blood_pressure.dart';

abstract class BloodPressureRepository{

  Future<Either<ApiException,String>> storeBloodPressure(int systolic,int diastolic);
  Future<Either<ApiException, List<PatientBloodPressure>>> getBloodPressureOfToday();
  Stream<Either<ApiException, BloodPressureHistoryForLast7Days>> getBloodPressureOfLast7Days();
  Future<Either<ApiException,BloodPressureSummaryWeekly>> getBloodPressureWeekly();
  Future<Either<ApiException,BloodPressureSummaryMonthly>> getBloodPressureMonthly();
}