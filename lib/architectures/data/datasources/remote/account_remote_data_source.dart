import 'dart:convert';

import 'package:kajiansunnah/architectures/data/dataparser/ParserUserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserAccount.dart';
import 'package:kajiansunnah/architectures/domain/entities/UserRegistration.dart';
import 'package:kajiansunnah/services/service_api.dart';

class AccountRemoteDataSource {
  static Future<UserAccount> getlogin(String email, String password) async {
    const String nama_api = "Login User";
    final apiURL = ServiceAPI.apiURL + "/auth/login";

    print("API ${nama_api}");
    print("URL ${apiURL}");

    Map<String, dynamic> postPure = {};

    postPure["email"] = email;
    postPure["password"] = password;

    final responsePost = await ServiceAPI.postAPI(
      namaAPI: nama_api,
      URL: apiURL,
      pureBodyPost: postPure,
      public: true,
    );

    final responAPI = responsePost;
    if (responAPI["status"] != "success") {
      throw (responAPI["message"].toString());
    }

    return ParserUserAccount.fromAPIResult(responAPI["result"]);
    //end of getlogin
  }

  static Future<void> register(UserRegistration userRegistration) async {
    const String nama_api = "Register User";
    final apiURL = ServiceAPI.apiURL + "/auth/register";

    print("API ${nama_api}");
    print("URL ${apiURL}");

    Map<String, dynamic> postPure = {};

    postPure["name"] = userRegistration.name;
    postPure["email"] = userRegistration.email;
    postPure["password"] = userRegistration.password;
    postPure["password_confirmation"] = userRegistration.confirmPassword;
    postPure["address"] = userRegistration.address;
    postPure["phone"] = userRegistration.phone;
    postPure["gender"] = userRegistration.gender;

    final responsePost = await ServiceAPI.postAPI(
      namaAPI: nama_api,
      URL: apiURL,
      pureBodyPost: postPure,
      public: true,
    );

    final responAPI = responsePost;
    if (responAPI["status"] != "success") {
      throw (responAPI["message"].toString());
    }

    //end of register
  }
}
