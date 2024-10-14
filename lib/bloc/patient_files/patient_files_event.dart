part of 'patient_files_bloc.dart';

sealed class PatientFilesEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetPatientFilesFromApi extends PatientFilesEvent{
  final int folderId;
  GetPatientFilesFromApi(this.folderId);
  @override
  List<Object> get props => [folderId];
}

