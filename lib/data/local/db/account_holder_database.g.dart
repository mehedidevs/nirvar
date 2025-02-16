// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_holder_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AccountHolderDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AccountHolderDatabaseBuilderContract addMigrations(
      List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AccountHolderDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AccountHolderDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAccountHolderDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AccountHolderDatabaseBuilderContract databaseBuilder(String name) =>
      _$AccountHolderDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AccountHolderDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AccountHolderDatabaseBuilder(null);
}

class _$AccountHolderDatabaseBuilder
    implements $AccountHolderDatabaseBuilderContract {
  _$AccountHolderDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AccountHolderDatabaseBuilderContract addMigrations(
      List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AccountHolderDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AccountHolderDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AccountHolderDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AccountHolderDatabase extends AccountHolderDatabase {
  _$AccountHolderDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AccountHolderDao? _accountHolderDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `account_holders` (`id` INTEGER NOT NULL, `name` TEXT, `email` TEXT, `number` TEXT, `password` TEXT, `photo` TEXT, `role` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AccountHolderDao get accountHolderDAO {
    return _accountHolderDAOInstance ??=
        _$AccountHolderDao(database, changeListener);
  }
}

class _$AccountHolderDao extends AccountHolderDao {
  _$AccountHolderDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _accountHolderInsertionAdapter = InsertionAdapter(
            database,
            'account_holders',
            (AccountHolder item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'number': item.number,
                  'password': item.password,
                  'photo': item.photo,
                  'role': item.role
                }),
        _accountHolderUpdateAdapter = UpdateAdapter(
            database,
            'account_holders',
            ['id'],
            (AccountHolder item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'number': item.number,
                  'password': item.password,
                  'photo': item.photo,
                  'role': item.role
                }),
        _accountHolderDeletionAdapter = DeletionAdapter(
            database,
            'account_holders',
            ['id'],
            (AccountHolder item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'number': item.number,
                  'password': item.password,
                  'photo': item.photo,
                  'role': item.role
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AccountHolder> _accountHolderInsertionAdapter;

  final UpdateAdapter<AccountHolder> _accountHolderUpdateAdapter;

  final DeletionAdapter<AccountHolder> _accountHolderDeletionAdapter;

  @override
  Future<List<AccountHolder>> getAllAccountHolders() async {
    return _queryAdapter.queryList('SELECT * FROM account_holders',
        mapper: (Map<String, Object?> row) => AccountHolder(
            id: row['id'] as int,
            name: row['name'] as String?,
            email: row['email'] as String?,
            number: row['number'] as String?,
            password: row['password'] as String?,
            photo: row['photo'] as String?,
            role: row['role'] as String?));
  }

  @override
  Future<AccountHolder?> findAccountHolderById(int id) async {
    return _queryAdapter.query(
        'SELECT * FROM account_holders WHERE id = ?1 LIMIT 1',
        mapper: (Map<String, Object?> row) => AccountHolder(
            id: row['id'] as int,
            name: row['name'] as String?,
            email: row['email'] as String?,
            number: row['number'] as String?,
            password: row['password'] as String?,
            photo: row['photo'] as String?,
            role: row['role'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertAccountHolder(AccountHolder accountHolder) async {
    await _accountHolderInsertionAdapter.insert(
        accountHolder, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAccountHolder(AccountHolder accountHolder) async {
    await _accountHolderUpdateAdapter.update(
        accountHolder, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAccountHolder(AccountHolder accountHolder) async {
    await _accountHolderDeletionAdapter.delete(accountHolder);
  }
}
