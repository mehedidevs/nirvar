import 'package:dartz/dartz.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/data/network/file/file_api_service.dart';
import 'package:nirvar/models/patient_files/patient_file.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';

class PatientFileRepositoryImpl extends PatientFileRepository{

  final FileApiService _fileApiService;

  PatientFileRepositoryImpl(this._fileApiService);

  @override
  Future<Either<ApiException, String>> deleteFile(int fileId) {
   return _fileApiService.deleteFile(fileId);
  }

  @override
  Stream<Either<ApiException, List<PatientFile>>> getAllPrescriptions(int folderID) {
    return _fileApiService.getAllPrescriptions(folderID);
  }

  @override
  Stream<Either<ApiException, List<PatientFile>>> getAllTestReports(int folderID) {
    return _fileApiService.getAllTestReports(folderID);
  }

  @override
  Future<Either<ApiException, String>> renameFile(int folderId, int fileId, String fileType, String fileName) {
   return _fileApiService.renameFile(folderId, fileId, fileType, fileName);
  }

}