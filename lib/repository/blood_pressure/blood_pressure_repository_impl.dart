
import 'package:dartz/dartz.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/data/network/blood_pressure/blood_pressure_api_service.dart';
import 'package:nirvar/models/blood_pressure_monthly/blood_pressure_summary_monthly.dart';
import 'package:nirvar/models/blood_pressure_weekly/blood_pressure_summary_weekly.dart';
import 'package:nirvar/models/patient_blood_pressure/patient_blood_pressure.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';

import '../../models/blood_pressure_last_seven_days/blood_pressure_history_for_last_7_days.dart';

class BloodPressureRepositoryImpl extends BloodPressureRepository{
  final BloodPressureApiService _apiService;

  BloodPressureRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiException, String>> storeBloodPressure(int systolic, int diastolic) {
   return _apiService.storeBloodPressure(systolic, diastolic);
  }

  @override
  Stream<Either<ApiException, BloodPressureHistoryForLast7Days>> getBloodPressureOfLast7Days() {
    return _apiService.getBloodPressureOfLast7Days();
  }

  @override
  Future<Either<ApiException, List<PatientBloodPressure>>> getBloodPressureOfToday() {
    return _apiService.getBloodPressureOfToday();
  }

  @override
  Future<Either<ApiException, BloodPressureSummaryWeekly>> getBloodPressureWeekly() {
    return _apiService.getBloodPressureWeekly();
  }

  @override
  Future<Either<ApiException, BloodPressureSummaryMonthly>> getBloodPressureMonthly() {
    return _apiService.getBloodPressureMonthly();
  }

}