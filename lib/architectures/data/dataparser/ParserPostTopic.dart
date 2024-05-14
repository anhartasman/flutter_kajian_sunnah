import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
import 'package:kajiansunnah/helpers/parser/parser_key.dart';

class ParserPostTopic {
  static Map<String, dynamic> defaultMap() {
    return PostTopic.defaultValue().toMap();
  }

  static Map<String, dynamic> mapToMap(Map<String, dynamic> map) {
    return PostTopic(
      id: ParserKey.getString(map, "id"),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    ).toMap();
  }

  static PostTopic fromAPIResult(Map<String, dynamic> theMap) {
    var defMap = mapToMap(theMap);
    return PostTopic.fromMap(defMap);
  }
}
