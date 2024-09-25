import 'package:dartz/dartz.dart';
import '../../core/resources/api_exception.dart';

abstract class DiabetesRepository{
  Future<Either<ApiException,String>> storeDiabetes(int sugarLevel);
}