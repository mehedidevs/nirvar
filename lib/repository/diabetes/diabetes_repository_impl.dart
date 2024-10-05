
import 'package:dartz/dartz.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/data/network/diabetes/diabetes_api_service.dart';
import 'package:nirvar/models/glucose_level_monthly/blood_glucose_monthly.dart';
import 'package:nirvar/models/glucose_level_weekly/blood_glucose_weekly.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';

import '../../models/glucose_level_last_seven_days/glucose_level_for_past_seven_days.dart';

class DiabetesRepositoryImpl extends DiabetesRepository{

  final DiabetesApiService _apiService;

  DiabetesRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiException, String>> storeDiabetes(double sugarLevel) {
    return _apiService.storeDiabetes(sugarLevel);
  }

  @override
  Future<Either<ApiException, GlucoseLevelForPastSevenDays>> getBloodGlucoseOfLast7Days() {
    return _apiService.getBloodGlucoseOfLast7Days();
  }

  @override
  Future<Either<ApiException, String>> getBloodGlucoseOfToday() {
   return _apiService.getBloodGlucoseOfToday();
  }

  @override
  Future<Either<ApiException, BloodGlucoseWeekly>> getBloodGlucoseWeekly() {
    return _apiService.getBloodGlucoseWeekly();
  }

  @override
  Future<Either<ApiException, BloodGlucoseMonthly>> getBloodGlucoseMonthly() {
   return _apiService.getBloodGlucoseMonthly();
  }
}