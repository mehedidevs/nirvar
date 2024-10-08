
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/resources/api_exception.dart';
import '../../models/latest_uploaded_files/latest_uploaded_file.dart';
import '../../models/patient_files/patient_file.dart';

abstract class PatientFileRepository {

  Stream<Either<ApiException,List<PatientFile>>> getAllPrescriptions(int folderID);

  Stream<Either<ApiException,List<PatientFile>>> getAllTestReports(int folderID);

  Future<Either<ApiException,String>> deleteFile(int fileId);

  Future<Either<ApiException,String>> renameFile(int folderId,int fileId,String fileType,String fileName);

  Future<Either<ApiException,String>> uploadFile({
    required String folderId,
    required File file,
    required String type,
    required String fileName,
  });

  Future<Either<ApiException,List<LatestUploadedFile>>> getLatestUploadedFiles();

}