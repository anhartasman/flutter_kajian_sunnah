import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';
import 'package:kajiansunnah/services/service_api.dart';

class PostRemoteDataSource {
  static Future<List<PostContent>> getPosts(SearchParam searchParam) async {
    const String nama_api = "getPosts";
    final apiURL = "${ServiceAPI.apiURL}/posts";

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

    List<PostContent> result = [];

    final dataMap = responAPI["result"]["data"];

    for (final data in dataMap) {
      debugPrint("data parsing: ${data}");
      result.add(PostContent.fromMap(data));
    }

    debugPrint("get result: ${result.length}");

    return result;
    //end of getPosts
  }
}
