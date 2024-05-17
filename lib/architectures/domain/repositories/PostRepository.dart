import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';

abstract class PostRepository {
  Future<List<PostContent>> getPosts(SearchParam searchParam);
}
