
import '../../data/local/entity/account_holder.dart';

abstract class AccountHolderRepository{

  Future<void> insertAccountHolder(AccountHolder accountHolder);

  Future<void> updateAccountHolder(AccountHolder accountHolder);

  Future<void> deleteAccountHolder(AccountHolder accountHolder);

  Future<List<AccountHolder>> getAllAccountHolders();

  Future<AccountHolder?> findAccountHolderById(int id);

  Future<void> upsertAccountHolder(AccountHolder accountHolder);
}