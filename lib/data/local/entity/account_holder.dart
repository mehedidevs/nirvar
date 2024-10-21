import 'package:floor/floor.dart';

@Entity(tableName: 'account_holders')
class AccountHolder {
  @primaryKey
  final int id;

  final String? name;
  final String? email;
  final String? number;
  final DateTime? registerAt;
  final String? photo;
  final String? role;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AccountHolder({
   required this.id,
    this.name,
    this.email,
    this.number,
    this.registerAt,
    this.photo,
    this.role,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });
}
