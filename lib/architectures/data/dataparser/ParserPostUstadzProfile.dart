import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';
import 'package:kajiansunnah/helpers/parser/parser_key.dart';

class ParserUstadzProfile {
  static Map<String, dynamic> defaultMap() {
    return UstadzProfile.defaultValue().toMap();
  }

  static Map<String, dynamic> mapToMap(Map<String, dynamic> map) {
    return UstadzProfile(
      id: ParserKey.getString(map, "id"),
      name: map['name'] ?? '',
      short_bio: map['short_bio'] ?? '',
      description: map['description'] ?? '',
    ).toMap();
  }

  static UstadzProfile fromAPIResult(Map<String, dynamic> theMap) {
    var defMap = mapToMap(theMap);
    return UstadzProfile.fromMap(defMap);
  }
}
