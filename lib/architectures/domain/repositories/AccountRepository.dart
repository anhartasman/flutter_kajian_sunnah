import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserRegistration.dart';

abstract class AccountRepository {
  Future<UserAccount> login(String email, String password);
  Future<void> register(UserRegistration userRegistration);
}
