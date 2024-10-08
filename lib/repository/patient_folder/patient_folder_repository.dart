
import 'package:dartz/dartz.dart';

import '../../core/resources/api_exception.dart';
import '../../models/created_folder_for_prescription/created_folder_for_prescription.dart';
import '../../models/patient_folder/patient_folder.dart';
import '../../models/selected_folder/selected_folder.dart';

abstract class PatientFolderRepository{

  Stream<Either<ApiException,List<PatientFolder>>> getAllFolders();

  Future<Either<ApiException,String>> createFolder(String folderName);

  Future<Either<ApiException, String>> updateFolder(int folderId, String folderName);

  Future<Either<ApiException, String>> deleteFolder(int folderId);

  Future<Either<ApiException,String>> shareFolder(int folderId);

  Future<Either<ApiException,List<SelectedFolder>>> selectFolder();

  Future<Either<ApiException, CreatedFolderForPrescription>> createFolderForPrescription(String folderName);

  Future<Either<ApiException,List<String>>> doctorSpeciality();
}