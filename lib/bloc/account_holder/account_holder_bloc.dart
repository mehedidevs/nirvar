import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/data/preference/user_id_storage.dart';
import 'package:nirvar/repository/account_holder/account_holder_repository.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';
import '../../data/local/entity/account_holder.dart';
import '../../injection_container.dart';


part 'account_holder_event.dart';

part 'account_holder_state.dart';

class AccountHolderBloc extends Bloc<AccountHolderEvent, AccountHolderState> {
  final AccountHolderRepository _repository;
  final AuthRepository _authRepository;

  AccountHolderBloc(this._repository, this._authRepository)
      : super(const AccountHolderState()) {
    on<FetchAllAccountHolders>(_onFetchingAllAccountHolders);
    on<InsertAccountHolder>(_onInsertAccountHolder);
    on<UpsertAccountHolder>(_onUpsertAccountHolder);
    on<AccountHolderUpdated>(_onAccountHolderUpdated);
    on<DeleteAccountHolder>(_onDeleteAccountHolder);
    on<FetchAccountHolderByID>(_onFetchAccountHolderByID);
    on<SwitchingAccountHolder>(_onSyncAccountHolder);
    on<LogOutAccountEvent>(_onLoggingOutAccount);
  }

  FutureOr<void> _onFetchingAllAccountHolders(
      FetchAllAccountHolders event, Emitter<AccountHolderState> emit) async {
    emit(state.copyWith(status: AccountHolderStatus.loading));
    await _fetchAndEmitAccountHolders(emit);
  }

  FutureOr<void> _onInsertAccountHolder(
      InsertAccountHolder event, Emitter<AccountHolderState> emit) async {
    emit(state.copyWith(status: AccountHolderStatus.loading));
    try {
      await _repository.insertAccountHolder(event.accountHolder);
      await _fetchAndEmitAccountHolders(emit);
    } catch (e) {
      emit(state.copyWith(
          status: AccountHolderStatus.failure, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onUpsertAccountHolder(
      UpsertAccountHolder event, Emitter<AccountHolderState> emit) async {
    emit(state.copyWith(status: AccountHolderStatus.loading));
    try {
      await _repository.upsertAccountHolder(event.accountHolder);
      await _fetchAndEmitAccountHolders(emit);
    } catch (e) {
      emit(state.copyWith(
          status: AccountHolderStatus.failure, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onAccountHolderUpdated(
      AccountHolderUpdated event, Emitter<AccountHolderState> emit) async {
    emit(state.copyWith(status: AccountHolderStatus.loading));
    try {
      await _repository.updateAccountHolder(event.accountHolder);
      await _fetchAndEmitAccountHolders(emit);
    } catch (e) {
      emit(state.copyWith(
          status: AccountHolderStatus.failure, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onDeleteAccountHolder(
      DeleteAccountHolder event, Emitter<AccountHolderState> emit) async {
    emit(state.copyWith(status: AccountHolderStatus.loading));
    try {
      await _repository.deleteAccountHolder(event.accountHolder);
      await _fetchAndEmitAccountHolders(emit);
    } catch (e) {
      emit(state.copyWith(
          status: AccountHolderStatus.failure, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onFetchAccountHolderByID(
      FetchAccountHolderByID event, Emitter<AccountHolderState> emit) async {
    emit(state.copyWith(status: AccountHolderStatus.loading));
    try {
      final accountHolder = await _repository.findAccountHolderById(event.id);
      if (accountHolder != null) {
        emit(state.copyWith(
            status: AccountHolderStatus.success,
            selectedAccountHolder: accountHolder));
      } else {
        emit(state.copyWith(
            status: AccountHolderStatus.failure,
            errorMessage: 'Account Holder not found'));
      }
    } catch (e) {
      emit(state.copyWith(
          status: AccountHolderStatus.failure, errorMessage: e.toString()));
    }
  }

  // Refactor repetitive fetching logic into this method
  Future<void> _fetchAndEmitAccountHolders(
      Emitter<AccountHolderState> emit) async {
    try {
      final response = await _repository.getAllAccountHolders();
      int? excludedId = await sl<UserIdStorage>().getUserID();
      final allAccountHolders =
          _filterExcludedAccountHolders(response, excludedId);
      emit(state.copyWith(
          status: AccountHolderStatus.success,
          accountHolders: allAccountHolders));
    } catch (e) {
      emit(state.copyWith(
          status: AccountHolderStatus.failure, errorMessage: e.toString()));
    }
  }

  List<AccountHolder> _filterExcludedAccountHolders(
      List<AccountHolder> accountHolders, int? excludedId) {
    return accountHolders
        .where((accountHolder) => accountHolder.id != excludedId)
        .toList();
  }

  FutureOr<void> _onSyncAccountHolder(
      SwitchingAccountHolder event, Emitter<AccountHolderState> emit) async {
    emit(state.copyWith(status: AccountHolderStatus.loading));

    bool isLogOut = false;

    try {
      final logoutResponse = await _authRepository.logoutUser();
      logoutResponse.fold(
        (failure) => emit(state.copyWith(
            status: AccountHolderStatus.failure,
            errorMessage: failure.message)),
        (success) => isLogOut = true,
      );

      if (isLogOut == true) {
        String phoneNumber = event.accountHolder.number ?? '';
        String password = event.accountHolder.password ?? '';
        final loginResponse =
            await _authRepository.loginUser(phoneNumber, password);

        loginResponse.fold(
          (failure) => emit(state.copyWith(
              status: AccountHolderStatus.failure,
              errorMessage: failure.message)),
          (success) {
            emit(state.copyWith(status: AccountHolderStatus.success));
          },
        );
      }
    } catch (e) {
      emit(state.copyWith(
          status: AccountHolderStatus.failure, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onLoggingOutAccount(
      LogOutAccountEvent event, Emitter<AccountHolderState> emit) {
    emit(state.copyWith(status: AccountHolderStatus.initial));
  }
}
