import 'package:flutter/material.dart';
import 'package:kajiansunnah/architectures/data/datasources/local/account_local_data_source.dart';
import 'package:kajiansunnah/architectures/data/datasources/remote/account_remote_data_source.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserRegistration.dart';
import 'package:kajiansunnah/architectures/domain/repositories/AccountRepository.dart';
import 'package:logging/logging.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataAccountRepository implements AccountRepository {
  late Logger _logger;

  DataAccountRepository() {
    _logger = Logger('DataAccountRepository');
  }

  @override
  Future<UserAccount> login(String email, String password) async {
    final userAccount = await AccountRemoteDataSource.getlogin(email, password);
    await AccountLocalDataSource.saveUser(userAccount);

    return userAccount;
  }

  @override
  Future<void> register(UserRegistration userRegistration) async {
    await AccountRemoteDataSource.register(userRegistration);
  }

  @override
  Future<UserAccount> getLoggedInUser() async {
    final userAccount = await AccountLocalDataSource.getLoggedInUser();
    debugPrint("Logged in user: " + userAccount.toJson());
    return userAccount;
  }

  @override
  Future<void> logout() async {
    await AccountRemoteDataSource.logout();
    await AccountLocalDataSource.logout();
  }
}
