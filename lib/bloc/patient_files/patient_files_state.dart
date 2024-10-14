part of 'patient_files_bloc.dart';

enum PatientFilesStatus { initial, loading, success, failure }

final class PatientFilesState extends Equatable {
  final PatientFilesStatus status;
  final PrescriptionData prescriptionData;
  final String errorMessage;

  const PatientFilesState({
    this.status = PatientFilesStatus.initial,
    this.prescriptionData = const PrescriptionData(prescriptions:  [] ,testReports: []),
    this.errorMessage = '',
  });

  PatientFilesState copyWith({
    PatientFilesStatus? status,
    PrescriptionData? prescriptionData,
    String? errorMessage,
  }){
    return PatientFilesState(
        status: status ?? this.status,
        prescriptionData: prescriptionData ?? this.prescriptionData,
        errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [status,prescriptionData,errorMessage];
}