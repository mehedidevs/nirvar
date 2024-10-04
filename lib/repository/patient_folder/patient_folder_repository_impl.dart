import 'package:dartz/dartz.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/data/network/folder/folder_api_service.dart';
import 'package:nirvar/models/patient_folder/patient_folder.dart';
import 'package:nirvar/models/selected_folder/selected_folder.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository.dart';

class PatientFolderRepositoryImpl extends PatientFolderRepository{
  final FolderApiService _folderApiService;

  PatientFolderRepositoryImpl(this._folderApiService);

  @override
  Future<Either<ApiException, String>> createFolder(String folderName) {
    return _folderApiService.createFolder(folderName);
  }

  @override
  Stream<Either<ApiException, List<PatientFolder>>> getAllFolders() {
    return _folderApiService.getAllFolders();
  }

  @override
  Future<Either<ApiException, String>> updateFolder(int folderId, String folderName) {
   return _folderApiService.updateFolder(folderId, folderName);
  }

  @override
  Future<Either<ApiException, String>> deleteFolder(int folderId) {
    return _folderApiService.deleteFolder(folderId);
  }

  @override
  Future<Either<ApiException, String>> shareFolder(int folderId) {
    return _folderApiService.shareFolder(folderId);
  }

  @override
  Future<Either<ApiException, List<SelectedFolder>>> selectFolder() {
   return _folderApiService.selectFolder();
  }

}