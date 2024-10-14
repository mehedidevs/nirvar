part of 'patient_folder_bloc.dart';


sealed class PatientFolderEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetPatientFolderFromApi extends PatientFolderEvent{}
class UpdatePatientFolderList extends PatientFolderEvent {
  final PatientFolder newFolder;

  UpdatePatientFolderList(this.newFolder);

  @override
  List<Object> get props => [newFolder];
}
