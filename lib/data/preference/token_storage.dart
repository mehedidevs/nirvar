import 'package:shared_preferences/shared_preferences.dart';

// class TokenStorage {
//   final SharedPreferences _prefs;
//
//   TokenStorage(this._prefs);
//
//   Future<void> saveToken(String token) async {
//     await _prefs.setString('auth_token', token);
//   }
//
//   Future<String?> getToken() async {
//     return _prefs.getString('auth_token');
//   }
//
//   Future<void> clearToken() async {
//     await _prefs.remove('auth_token');
//   }
// }
//
// import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
