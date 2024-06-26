import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';
import 'package:kajiansunnah/services/service_api.dart';

class HomeRemoteDataSource {
  static Future<List<PostTopic>> getTopic() async {
    const String nama_api = "getTopic";
    final apiURL = "${ServiceAPI.apiURL}/posts/topics";

    print("API ${nama_api}");
    print("URL ${apiURL}");

    Map<String, dynamic> postPure = {};

    final responsePost = await ServiceAPI.getAPI(
      URL: apiURL,
      query: postPure,
    );

    final responAPI = responsePost;
    if (responAPI["status"] != "success") {
      throw (responAPI["message"].toString());
    }

    List<PostTopic> result = [];

    final tagsMap = responAPI["result"]["tags"];

    for (final tag in tagsMap) {
      debugPrint("tag parsing: ${tag}");
      result.add(PostTopic.fromMap(tag));
    }

    debugPrint("get result: ${result.length}");

    return result;
    //end of getTopic
  }

  static Future<List<UstadzProfile>> getUstadzProfile(
      SearchParam searchParam) async {
    const String nama_api = "getUstadzProfile";
    final apiURL = "${ServiceAPI.apiURL}/ustadz";

    print("API ${nama_api}");
    print("URL ${apiURL}");

    Map<String, dynamic> postPure = searchParam.toMap();

    final responsePost = await ServiceAPI.getAPI(
      URL: apiURL,
      query: postPure,
    );

    final responAPI = responsePost;
    if (responAPI["status"] != "success") {
      throw (responAPI["message"].toString());
    }

    List<UstadzProfile> result = [];

    final dataMap = responAPI["result"]["data"];

    for (final data in dataMap) {
      debugPrint("data parsing: ${data}");
      result.add(UstadzProfile.fromMap(data));
    }

    debugPrint("get result: ${result.length}");

    return result;
    //end of getUstadzProfile
  }
}
