import 'package:kajiansunnah/architectures/data/dataparser/ParserUserProfile.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/helpers/parser/parser_key.dart';

class ParserUserAccount {
  static Map<String, dynamic> defaultMap() {
    return {
      'id': "",
      'email': "",
      'token': "",
      'profil': ParserUserProfile.defaultMap(),
    };
  }

  static UserAccount createDefault() {
    var defMap = defaultMap();

    return UserAccount.fromMap(defMap);
  }

  static Map<String, dynamic> mapToMap(Map<String, dynamic> theMap) {
    var defMap = defaultMap();

    defMap["id"] = ParserKey.getString(theMap["user"], "id");
    defMap["email"] = ParserKey.getString(theMap["user"], "email");
    defMap["token"] = ParserKey.getString(theMap, "token");
    defMap["profil"] = ParserUserProfile.mapToMap(theMap["user"]);
    return defMap;
  }

  static UserAccount fromAPIResult(Map<String, dynamic> theMap) {
    var defMap = mapToMap(theMap);
    return UserAccount.fromMap(defMap);
  }
}
