part of 'patient_folder_bloc.dart';

enum PatientFolderStatus { initial, loading, success, failure }

final class PatientFolderState extends Equatable {
  final PatientFolderStatus status;
  final List<PatientFolder> folderList;
  final String errorMessage;

  const PatientFolderState({
    this.status = PatientFolderStatus.initial,
    this.folderList = const [],
    this.errorMessage = '',
  });

  PatientFolderState copyWith({
    PatientFolderStatus? status,
    List<PatientFolder>? folderList,
    String? errorMessage,
  }){
    return PatientFolderState(
        status: status ?? this.status,
        folderList: folderList ?? this.folderList,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status,folderList,errorMessage];
}