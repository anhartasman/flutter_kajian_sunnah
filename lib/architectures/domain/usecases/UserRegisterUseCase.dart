import 'dart:async';

import 'package:kajiansunnah/architectures/domain/entities/UserRegistration.dart';
import 'package:kajiansunnah/architectures/domain/repositories/AccountRepository.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

class UserRegisterUseCase extends UseCase<void, UserRegistration> {
  UserRegisterUseCase(this.repository);

  final AccountRepository repository;

  @override
  Future<Stream<void>> call(
    UserRegistration param,
  ) async {
    final StreamController<void> controller = StreamController();

    repository.register(param).then((the_respon) {
      controller.add((the_respon));

      controller.close();
    }).catchError((e) {
      print("add error UserRegisterUseCase ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    });

    return controller.stream;
  }
}
