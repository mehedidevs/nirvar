part of 'account_holder_bloc.dart';


enum AccountHolderStatus { initial, loading, success, failure }

final class AccountHolderState extends Equatable {
  final AccountHolderStatus status;
  final List<AccountHolder> accountHolders;
  final AccountHolder? selectedAccountHolder;
  final String errorMessage;

  const AccountHolderState({
    this.status = AccountHolderStatus.initial,
    this.accountHolders = const [],
    this.selectedAccountHolder,
    this.errorMessage = '',
  });

  AccountHolderState copyWith({
    AccountHolderStatus? status,
    List<AccountHolder>? accountHolders,
    AccountHolder? selectedAccountHolder,
    String? errorMessage,
  }) {
    return AccountHolderState(
      status: status ?? this.status,
      accountHolders: accountHolders ?? this.accountHolders,
      selectedAccountHolder: selectedAccountHolder ?? this.selectedAccountHolder,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, accountHolders, selectedAccountHolder, errorMessage];
}
