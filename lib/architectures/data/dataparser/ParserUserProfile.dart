import 'package:kajiansunnah/architectures/domain/entities/UserProfile.dart';
import 'package:kajiansunnah/helpers/parser/parser_key.dart';

class ParserUserProfile {
  static Map<String, dynamic> defaultMap() {
    return {
      'id': "",
      'uuid': "",
      'name': "",
      'address': "",
      'phone': "",
      'gender': "",
      'avatar': "",
    };
  }

  static UserProfile createDefault() {
    var defMap = defaultMap();

    return UserProfile.fromMap(defMap);
  }

  static Map<String, dynamic> mapToMap(Map<String, dynamic> theMap) {
    var defMap = defaultMap();

    defMap["id"] = ParserKey.getString(theMap, "id");
    defMap["uuid"] = ParserKey.getString(theMap, "uuid");
    defMap["name"] = ParserKey.getString(theMap, "name");
    defMap["address"] = ParserKey.getString(theMap, "address");
    defMap["phone"] = ParserKey.getString(theMap, "phone");
    defMap["gender"] = ParserKey.getString(theMap, "gender");
    defMap["avatar"] = ParserKey.getString(theMap, "avatar");
    return defMap;
  }

  static UserProfile fromAPIResult(Map<String, dynamic> theMap) {
    var defMap = mapToMap(theMap);
    return UserProfile.fromMap(defMap);
  }
}
