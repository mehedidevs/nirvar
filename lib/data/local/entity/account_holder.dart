import 'package:floor/floor.dart';

@Entity(tableName: 'account_holders')
class AccountHolder {
  @primaryKey
  final int id;

  final String? name;
  final String? email;
  final String? number;
  final String? password;
  final String? photo;
  final String? role;


  AccountHolder({
   required this.id,
    this.name,
    this.email,
    this.number,
    this.password,
    this.photo,
    this.role,
  });
}
