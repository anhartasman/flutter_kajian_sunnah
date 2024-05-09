import 'dart:async';

import 'package:kajiansunnah/architectures/domain/repositories/AccountRepository.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

class UserLogoutUseCase extends UseCase<void, NoParams> {
  UserLogoutUseCase(this.repository);

  final AccountRepository repository;

  @override
  Future<Stream<void>> call(
    NoParams param,
  ) async {
    final StreamController<void> controller = StreamController();

    repository.logout().then((the_respon) {
      controller.add((the_respon));

      controller.close();
    }).catchError((e) {
      print("add error UserLogoutUseCase ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    });

    return controller.stream;
  }
}
