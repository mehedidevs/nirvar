import 'package:dartz/dartz.dart';

import '../../core/resources/api_exception.dart';

abstract class BloodPressureRepository{

  Future<Either<ApiException,String>> storeBloodPressure(int systolic,int diastolic);
}