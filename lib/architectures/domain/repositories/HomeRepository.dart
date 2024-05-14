import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';

abstract class HomeRepository {
  Future<List<PostTopic>> getTopic();
  Future<List<UstadzProfile>> getUstadzProfile();
}
