import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kajiansunnah/const/const_text.dart';
import 'package:openpgp/openpgp.dart' as openpgp;
import 'package:shared_preferences/shared_preferences.dart';

class ServiceAPI {
  static String get apiURL {
    return "https://stackovercode.my.id/api/v1";
  }

  static Future<Map<String, dynamic>> postAPI({
    required String namaAPI,
    required String URL,
    required Map<String, dynamic> pureBodyPost,
    bool public = true,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userToken = prefs.getString("userToken");

      print("API ${namaAPI}");
      print("URL ${URL}");

      Map<String, dynamic>? headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      if (!public) {
        headers["Authorization"] = "Bearer $userToken";
        // headers["Authorization"] = "Bearer 333.444.545.4545.adad";
      }

      final strHeaders = json.encode(headers);
      print("Header ${namaAPI}");
      print(strHeaders);

      print("/// request ${namaAPI} ///");

      final postJsonPure = json.encode(pureBodyPost);
      print(postJsonPure);

      var dio = Dio();

      final responseDio = await dio.post(
        URL,
        data: pureBodyPost,
        options: Options(
          responseType: ResponseType.json,
          headers: headers,
          sendTimeout: 20000,
          receiveTimeout: 20000,
        ),
      );

      if (responseDio.statusCode == 200) {
        print("/// response request ${namaAPI} ///");
        final strResponse = json.encode(responseDio.data);
        print(strResponse);
        return responseDio.data;
      } else {
        throw ("$namaAPI statusCode: " + responseDio.statusCode.toString());
      }
    } on DioError catch (e) {
      print("dio error ${e.response?.statusCode}");
      if (e.response?.statusCode == 400 || e.response?.statusCode == 422) {
        throw (e.response?.data["message"]);
      }
      throw (INTERNET_LEMAH);
    } catch (error) {
      throw (INTERNET_LEMAH);
      // throw ("network_exception." + error.toString());
    }
  }

  static Future<Map<String, dynamic>> getAPI({
    required String URL,
    required Map<String, dynamic> query,
  }) async {
    try {
      print("URL ${URL}");

      Map<String, dynamic>? headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };

      final strHeaders = json.encode(headers);

      print(strHeaders);
      var dio = Dio();

      final responseDio = await dio.get(
        URL,
        queryParameters: query,
        options: Options(
          responseType: ResponseType.json,
          headers: headers,
        ),
      );

      if (responseDio.statusCode == 200) {
        print("/// response request ///");
        print(json.encode(responseDio.data));
        return responseDio.data;
      } else {
        throw ("statusCode: " + responseDio.statusCode.toString());
      }
    } catch (error) {
      throw (INTERNET_LEMAH);
      // throw ("network_exception." + error.toString());
    }
  }
}
