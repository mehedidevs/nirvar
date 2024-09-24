
import 'package:dartz/dartz.dart';

import '../../core/resources/api_exception.dart';
import '../../models/patient_folder/patient_folder.dart';

abstract class PatientFolderRepository{

  Stream<Either<ApiException,List<PatientFolder>>> getAllFolders();

  Future<Either<ApiException,String>> createFolder(String folderName);

  Future<Either<ApiException, String>> updateFolder(int folderId, String folderName);

  Future<Either<ApiException, String>> deleteFolder(int folderId);

}