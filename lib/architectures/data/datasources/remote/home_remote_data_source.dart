import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:kajiansunnah/architectures/data/dataparser/ParserPostTopic.dart';
import 'package:kajiansunnah/architectures/data/dataparser/ParserPostUstadzProfile.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
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
      result.add(ParserPostTopic.fromAPIResult(tag));
    }

    debugPrint("get result: ${result.length}");

    return result;
    //end of getTopic
  }

  static Future<List<UstadzProfile>> getUstadzProfile() async {
    const String nama_api = "getUstadzProfile";
    final apiURL =
        "${ServiceAPI.apiURL}/ustadz?limit=5&page=1&sort=-created_at";

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

    List<UstadzProfile> result = [];

    final dataMap = responAPI["result"]["data"];

    for (final data in dataMap) {
      debugPrint("data parsing: ${data}");
      result.add(ParserUstadzProfile.fromAPIResult(data));
    }

    debugPrint("get result: ${result.length}");

    return result;
    //end of getUstadzProfile
  }
}
