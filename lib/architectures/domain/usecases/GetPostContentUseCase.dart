import 'dart:async';

import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';
import 'package:kajiansunnah/architectures/domain/repositories/PostRepository.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

class GetPostContentUseCase extends UseCase<List<PostContent>, SearchParam> {
  GetPostContentUseCase(this.repository);

  final PostRepository repository;

  @override
  Future<Stream<List<PostContent>>> call(
    SearchParam param,
  ) async {
    final StreamController<List<PostContent>> controller = StreamController();

    repository.getPosts(param).then((the_respon) {
      controller.add((the_respon));

      controller.close();
    }).catchError((e) {
      print("add error GetPostContentUseCase ${e}");
      // yield (balikanError.balikan(e.toString()));

      controller.addError(e);
    });

    return controller.stream;
  }
}
