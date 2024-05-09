import 'dart:convert';

import 'package:kajiansunnah/architectures/data/dataparser/ParserUserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/services/service_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountLocalDataSource {
  static Future<void> saveUser(UserAccount userAccount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userToken", userAccount.token);
    await prefs.setString("userAccount", userAccount.toJson());
    //end of getlogin
  }

  static Future<UserAccount> getLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString("userAccount")!;
    return UserAccount.fromJson(userJson);
    //end of getLoggedInUser
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("userToken");
    await prefs.remove("userAccount");
  }
}
