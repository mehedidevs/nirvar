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

  // Get an AccountHolder by id (since id is unique)
  @Query('SELECT * FROM account_holders WHERE id = :id LIMIT 1')
  Future<AccountHolder?> findAccountHolderById(int id);

  // Upsert method: Insert if not exists, otherwise update
  Future<void> upsertAccountHolder(AccountHolder accountHolder) async {
    final existingAccountHolder = await findAccountHolderById(accountHolder.id);
    if (existingAccountHolder != null) {
      // User exists, update the existing one
      await updateAccountHolder(accountHolder);
    } else {
      // User doesn't exist, insert a new one
      await insertAccountHolder(accountHolder);
    }
  }



}
