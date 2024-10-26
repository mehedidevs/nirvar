import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/patient_folder/patient_folder_repository.dart';

import '../../core/resources/api_exception.dart';
import '../../models/patient_folder/patient_folder.dart';

part 'patient_folder_event.dart';
part 'patient_folder_state.dart';

class PatientFolderBloc extends Bloc<PatientFolderEvent,PatientFolderState>{
  final PatientFolderRepository _folderRepository;

  PatientFolderBloc(this._folderRepository) : super(const PatientFolderState()){
    on<GetPatientFolderFromApi>(_onGettingPatientFolderList);
    on<UpdatePatientFolderList>(_onUpdatingPatientFolderList);
    on<DeletePatientFolderList>(_onDeletingPatientFolderItemFromList);
    on<LogoutEvent>(_onLoggingOut);
  }

  FutureOr<void> _onGettingPatientFolderList(GetPatientFolderFromApi event, Emitter<PatientFolderState> emit) async {
    emit(state.copyWith(status: PatientFolderStatus.loading));

    await emit.forEach(
      _folderRepository.getAllFolders(),
      onData: (Either<ApiException, List<PatientFolder>> result) {
        return result.fold(
              (failure) => state.copyWith(
              status: PatientFolderStatus.failure,
              errorMessage: failure.message
          ),
              (folders) => state.copyWith(
              status: PatientFolderStatus.success,
              folderList: folders
          ),
        );
      },
      onError: (error, stackTrace) {
        return state.copyWith(
            status: PatientFolderStatus.failure,
            errorMessage: error.toString()
        );
      },
    );
  }

  FutureOr<void> _onUpdatingPatientFolderList(UpdatePatientFolderList event, Emitter<PatientFolderState> emit) {
    // Create a new list of folders, including the newly added folder
    // final updatedFolderList = List<PatientFolder>.from(state.folderList)
    //   ..add(event.newFolder); // Add the new folder to the existing list

    List<PatientFolder> updatedFolderList = [];

    if(state.folderList.isEmpty){
      updatedFolderList = [event.newFolder];
    }else{
      updatedFolderList = [event.newFolder, ...state.folderList];
    }

    // Emit the updated state with the new list
    emit(state.copyWith(
      folderList: updatedFolderList, // Updated list with the new folder
      status: PatientFolderStatus.success, // Ensure the status is set to success
    ));
  }

  FutureOr<void> _onDeletingPatientFolderItemFromList(DeletePatientFolderList event, Emitter<PatientFolderState> emit) {
    // Get the current list of folders
    final currentFolderList = state.folderList;

    // Remove the folder with the matching ID
    final updatedFolderList = currentFolderList.where((folder) => event.folderId != folder.folderId.toString()).toList();

    // Check if the updated list is empty and ensure state is updated accordingly
    if (updatedFolderList.isEmpty) {
      emit(state.copyWith(
        folderList: [], // Empty list
        status: PatientFolderStatus.success,
      ));
    } else {
      emit(state.copyWith(
        folderList: updatedFolderList, // Updated list without the removed folder
        status: PatientFolderStatus.success,
      ));
    }
  }



  FutureOr<void> _onLoggingOut(LogoutEvent event, Emitter<PatientFolderState> emit) {
    emit(state.copyWith(status: PatientFolderStatus.initial,folderList: List.empty()));
  }


}