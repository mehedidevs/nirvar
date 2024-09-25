
import 'package:dartz/dartz.dart';

import '../../core/resources/api_exception.dart';
import '../../models/patient_files/patient_file.dart';

abstract class PatientFileRepository {

  Stream<Either<ApiException,List<PatientFile>>> getAllPrescriptions(int folderID);

  Stream<Either<ApiException,List<PatientFile>>> getAllTestReports(int folderID);

  Future<Either<ApiException,String>> deleteFile(int fileId);
}