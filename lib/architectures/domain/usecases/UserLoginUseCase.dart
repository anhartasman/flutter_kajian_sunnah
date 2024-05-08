import 'dart:async';

import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/architectures/domain/repositories/AccountRepository.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

class UserLoginUseCase extends UseCase<UserAccount, UserLoginUseCaseParam> {
  UserLoginUseCase(this.repository);

  final AccountRepository repository;

  @override
  Future<Stream<UserAccount>> call(
    UserLoginUseCaseParam param,
  ) async {
    final StreamController<UserAccount> controller = StreamController();

    repository.login(param.email, param.password).then((the_respon) {
      controller.add((the_respon));

      controller.close();
    }).catchError((e) {
      print("add error UserLoginUseCase ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    });

    return controller.stream;
  }
}

class UserLoginUseCaseParam {
  final String email;
  final String password;
  UserLoginUseCaseParam({required this.email, required this.password});
}
