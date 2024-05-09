import 'dart:async';

import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/architectures/domain/repositories/AccountRepository.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

class GetLoggedInUserUseCase extends UseCase<UserAccount, NoParams> {
  GetLoggedInUserUseCase(this.repository);

  final AccountRepository repository;

  @override
  Future<Stream<UserAccount>> call(
    NoParams param,
  ) async {
    final StreamController<UserAccount> controller = StreamController();

    repository.getLoggedInUser().then((the_respon) {
      controller.add((the_respon));

      controller.close();
    }).catchError((e) {
      print("add error GetLoggedInUserUseCase ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    });

    return controller.stream;
  }
}
