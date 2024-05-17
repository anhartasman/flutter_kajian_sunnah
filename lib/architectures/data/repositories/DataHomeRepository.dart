import 'package:kajiansunnah/architectures/data/datasources/remote/home_remote_data_source.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';
import 'package:kajiansunnah/architectures/domain/repositories/HomeRepository.dart';
import 'package:logging/logging.dart';

/// `DataProductCategoryRepository` is the implementation of `ProductCategoryRepository` present
/// in the Domain layer. It communicates with the server, making API calls to register, login, logout, and
/// store a `User`.
class DataHomeRepository implements HomeRepository {
  late Logger _logger;

  DataHomeRepository() {
    _logger = Logger('DataHomeRepository');
  }

  @override
  Future<List<PostTopic>> getTopic() async {
    final result = await HomeRemoteDataSource.getTopic();

    return result;
  }

  @override
  Future<List<UstadzProfile>> getUstadzProfile(SearchParam searchParam) async {
    final result = await HomeRemoteDataSource.getUstadzProfile(searchParam);

    return result;
  }
}
