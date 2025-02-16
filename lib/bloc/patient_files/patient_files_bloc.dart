import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/core/resources/api_exception.dart';
import 'package:nirvar/repository/patient_file/patient_file_repository.dart';

import '../../models/preccription_data/prescription_data.dart';

part 'patient_files_event.dart';
part 'patient_files_state.dart';


class PatientFileBloc extends Bloc<PatientFilesEvent,PatientFilesState>{
  final PatientFileRepository _repository;

  PatientFileBloc(this._repository) : super(const PatientFilesState()){
    on<GetPatientFilesFromApi>(_onGettingPatientFiles);
  }

  FutureOr<void> _onGettingPatientFiles(GetPatientFilesFromApi event, Emitter<PatientFilesState> emit) async {

    emit(state.copyWith(status: PatientFilesStatus.loading));

    await emit.forEach(
      _repository.getAllPatientFiles(event.folderId),
      onData: (Either<ApiException,PrescriptionData> result){
        return result.fold(
              (failure) => state.copyWith(
              status: PatientFilesStatus.failure,
              errorMessage: failure.message
          ),
              (prescription) => state.copyWith(
              status: PatientFilesStatus.success,
              prescriptionData: prescription
          ),
        );
      },
      onError: (error, stackTrace) {
        return state.copyWith(
            status: PatientFilesStatus.failure,
            errorMessage: error.toString()
        );
      },
    );

  }
}