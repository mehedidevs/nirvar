part of 'account_holder_bloc.dart';

sealed class AccountHolderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


// Event to handle fetching all account holders from the local database
final class FetchAllAccountHolders extends AccountHolderEvent {
  @override
  List<Object?> get props => [];
}

// Event to handle inserting/updating an account holder in the local database
final class UpsertAccountHolder extends AccountHolderEvent {
  final AccountHolder accountHolder;

  UpsertAccountHolder({required this.accountHolder});

  @override
  List<Object?> get props => [accountHolder];
}


// Event to handle inserting/updating an account holder in the local database
final class InsertAccountHolder extends AccountHolderEvent {
  final AccountHolder accountHolder;

  InsertAccountHolder({required this.accountHolder});

  @override
  List<Object?> get props => [accountHolder];
}

// Event to handle changes in the account holder's data (e.g., name, email, etc.)
final class AccountHolderUpdated extends AccountHolderEvent {
  final AccountHolder accountHolder;

  AccountHolderUpdated({required this.accountHolder});

  @override
  List<Object?> get props => [accountHolder];
}


// Event to handle deletion of an account holder
final class DeleteAccountHolder extends AccountHolderEvent {
  final AccountHolder accountHolder;

  DeleteAccountHolder({required this.accountHolder});

  @override
  List<Object?> get props => [accountHolder];
}


// Event to handle fetching the account holder from the local database
final class FetchAccountHolderByID extends AccountHolderEvent {
  final int id;

  FetchAccountHolderByID({required this.id});

  @override
  List<Object?> get props => [id];
}

// Event to handle API call or sync action for the account holder
final class SyncAccountHolder extends AccountHolderEvent {
  final AccountHolder accountHolder;

  SyncAccountHolder({required this.accountHolder});

  @override
  List<Object?> get props => [accountHolder];
}
