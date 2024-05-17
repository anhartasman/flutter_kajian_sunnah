import 'package:kajiansunnah/architectures/data/datasources/remote/home_remote_data_source.dart';
import 'package:kajiansunnah/architectures/data/datasources/remote/post_remote_data_source.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';
import 'package:kajiansunnah/architectures/domain/repositories/PostRepository.dart';
import 'package:logging/logging.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataPostRepository implements PostRepository {
  late Logger _logger;

  DataPostRepository() {
    _logger = Logger('DataPostRepository');
  }

  @override
  Future<List<PostContent>> getPosts(SearchParam searchParam) async {
    final result = await PostRemoteDataSource.getPosts(searchParam);

    return result;
  }
}
