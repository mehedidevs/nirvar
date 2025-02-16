
import '../../data/local/dao/account_holder_dao.dart';
import '../../data/local/entity/account_holder.dart';
import 'account_holder_repository.dart';

class AccountHolderRepositoryImpl implements AccountHolderRepository {
  final AccountHolderDao _accountHolderDao;

  // Constructor to receive the DAO via dependency injection
  AccountHolderRepositoryImpl(this._accountHolderDao);

  @override
  Future<void> insertAccountHolder(AccountHolder accountHolder) async {
    await _accountHolderDao.insertAccountHolder(accountHolder);
  }

  @override
  Future<void> updateAccountHolder(AccountHolder accountHolder) async {
    await _accountHolderDao.updateAccountHolder(accountHolder);
  }

  @override
  Future<void> deleteAccountHolder(AccountHolder accountHolder) async {
    await _accountHolderDao.deleteAccountHolder(accountHolder);
  }

  @override
  Future<List<AccountHolder>> getAllAccountHolders() async {
    return await _accountHolderDao.getAllAccountHolders();
  }

  @override
  Future<AccountHolder?> findAccountHolderById(int id) async {
    return await _accountHolderDao.findAccountHolderById(id);
  }

  @override
  Future<void> upsertAccountHolder(AccountHolder accountHolder) async {
    // Check if the AccountHolder exists in the database
    final existingAccountHolder = await _accountHolderDao.findAccountHolderById(accountHolder.id);
    if (existingAccountHolder != null) {
      // Update the existing record
      await _accountHolderDao.updateAccountHolder(accountHolder);
    } else {
      // Insert a new record
      await _accountHolderDao.insertAccountHolder(accountHolder);
    }
  }
}