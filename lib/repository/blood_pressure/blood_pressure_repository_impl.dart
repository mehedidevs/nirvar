
import 'package:dartz/dartz.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/data/network/blood_pressure/blood_pressure_api_service.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';

class BloodPressureRepositoryImpl extends BloodPressureRepository{
  final BloodPressureApiService _apiService;

  BloodPressureRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiException, String>> storeBloodPressure(int systolic, int diastolic) {
   return _apiService.storeBloodPressure(systolic, diastolic);
  }

}