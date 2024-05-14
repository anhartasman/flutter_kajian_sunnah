import 'dart:async';

import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
import 'package:kajiansunnah/architectures/domain/repositories/HomeRepository.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

class GetTopicUseCase extends UseCase<List<PostTopic>, NoParams> {
  GetTopicUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Stream<List<PostTopic>>> call(
    NoParams param,
  ) async {
    final StreamController<List<PostTopic>> controller = StreamController();

    repository.getTopic().then((the_respon) {
      controller.add((the_respon));

      controller.close();
    }).catchError((e) {
      print("add error GetTopicUseCase ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    });

    return controller.stream;
  }
}
