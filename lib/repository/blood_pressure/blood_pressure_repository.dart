import 'package:dartz/dartz.dart';

import '../../core/resources/api_exception.dart';
import '../../models/patient_blood_pressure/patient_blood_pressure.dart';

abstract class BloodPressureRepository{

  Future<Either<ApiException,String>> storeBloodPressure(int systolic,int diastolic);
  Stream<Either<ApiException, List<PatientBloodPressure>>> getBloodPressureOfToday();
  Stream<Either<ApiException, List<PatientBloodPressure>>> getBloodPressureOfLast7Days();
}