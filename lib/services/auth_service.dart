import 'package:get/get.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;
  bool isLoggedIn = false;
  UserAccount? theUser;
  void setIsLoggedIn(
    bool newValue, {
    UserAccount? newUser,
  }) {
    isLoggedIn = newValue;
    if (newValue) {
      theUser = newUser;
    }
  }

  Future<void> logout() async {}
}
