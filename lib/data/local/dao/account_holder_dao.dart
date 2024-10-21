import 'package:floor/floor.dart';

import '../entity/account_holder.dart';


@dao
abstract class AccountHolderDao {
  // Insert a new AccountHolder
  @insert
  Future<void> insertAccountHolder(AccountHolder accountHolder);

  // Update an existing AccountHolder
  @update
  Future<void> updateAccountHolder(AccountHolder accountHolder);

  // Delete an AccountHolder
  @delete
  Future<void> deleteAccountHolder(AccountHolder accountHolder);

  // Get all AccountHolders
  @Query('SELECT * FROM account_holders')
  Future<List<AccountHolder>> getAllAccountHolders();
}
