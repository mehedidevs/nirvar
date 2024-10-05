import 'package:dartz/dartz.dart';
import '../../core/resources/api_exception.dart';
import '../../models/glucose_level_last_seven_days/glucose_level_for_past_seven_days.dart';
import '../../models/glucose_level_monthly/blood_glucose_monthly.dart';
import '../../models/glucose_level_weekly/blood_glucose_weekly.dart';


abstract class DiabetesRepository{
  Future<Either<ApiException,String>> storeDiabetes(double sugarLevel);
  Future<Either<ApiException, String>> getBloodGlucoseOfToday();
  Future<Either<ApiException, GlucoseLevelForPastSevenDays>> getBloodGlucoseOfLast7Days();
  Future<Either<ApiException,BloodGlucoseWeekly>> getBloodGlucoseWeekly();
  Future<Either<ApiException,BloodGlucoseMonthly>> getBloodGlucoseMonthly();
}