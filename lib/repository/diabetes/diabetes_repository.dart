import 'package:dartz/dartz.dart';
import '../../core/resources/api_exception.dart';
import '../../models/glucose_level/glucose_level.dart';
import '../../models/patient_glucose/patient_glucose.dart';

abstract class DiabetesRepository{
  Future<Either<ApiException,String>> storeDiabetes(int sugarLevel);
  Stream<Either<ApiException,List<PatientGlucose>>> getBloodGlucoseOfLast7Days();
  Future<Either<ApiException, GlucoseLevel>> getBloodGlucoseOfToday();
}