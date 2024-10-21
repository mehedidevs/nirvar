part of 'patient_folder_bloc.dart';


sealed class PatientFolderEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetPatientFolderFromApi extends PatientFolderEvent{}
final class UpdatePatientFolderList extends PatientFolderEvent {
  final PatientFolder newFolder;

  UpdatePatientFolderList(this.newFolder);

  @override
  List<Object> get props => [newFolder];
}

final class DeletePatientFolderList extends PatientFolderEvent {
  final String folderId;

  DeletePatientFolderList(this.folderId);

  @override
  List<Object> get props => [folderId];
}

final class LogoutEvent extends PatientFolderEvent {}
