import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:nirvar/data/local/dao/account_holder_dao.dart';
import '../entity/account_holder.dart';


part 'account_holder_database.g.dart';

@Database(version: 1, entities: [AccountHolder])
abstract class AccountHolderDatabase extends FloorDatabase {
  AccountHolderDao get accountHolderDAO;
}
