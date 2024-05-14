import 'dart:async';

import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';
import 'package:kajiansunnah/architectures/domain/repositories/HomeRepository.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

class GetUstadzProfileUseCase extends UseCase<List<UstadzProfile>, NoParams> {
  GetUstadzProfileUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Stream<List<UstadzProfile>>> call(
    NoParams param,
  ) async {
    final StreamController<List<UstadzProfile>> controller = StreamController();

    repository.getUstadzProfile().then((the_respon) {
      controller.add((the_respon));

      controller.close();
    }).catchError((e) {
      print("add error GetUstadzProfileUseCase ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    });

    return controller.stream;
  }
}
