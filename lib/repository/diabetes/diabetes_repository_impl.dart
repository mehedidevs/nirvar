
import 'package:dartz/dartz.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/data/network/diabetes/diabetes_api_service.dart';
import 'package:nirvar/repository/diabetes/diabetes_repository.dart';

class DiabetesRepositoryImpl extends DiabetesRepository{

  final DiabetesApiService _apiService;

  DiabetesRepositoryImpl(this._apiService);

  @override
  Future<Either<ApiException, String>> storeDiabetes(int sugarLevel) {
    return _apiService.storeDiabetes(sugarLevel);
  }



}