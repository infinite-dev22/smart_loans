import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:smart_loans/config/web_config.dart';
import 'package:smart_loans/data_source/daos/interfaces/simple_dao.dart';
import 'package:smart_loans/init.dart';

class LoanDurationDaoImpl extends SimpleDao {
  var prefs = getLocalStorage();

  @override
  Future<Map<String, dynamic>> fetch(int id) async {
    var token = prefs.read("authToken");
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer $token"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.get(
        Uri.https(appUrl, 'api/loan-duration/show/$id').toString(),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<List<dynamic>> fetchAll() async {
    var token = prefs.read("authToken");
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer $token"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.get(
        Uri.https(appUrl, 'api/loan-duration').toString(),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future post(Map<String, dynamic> data) async {
    var token = prefs.read("authToken");
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer $token"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.post(
        Uri.https(appUrl, 'api/loan-duration/create').toString(),
        data: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future put(Map<String, dynamic> data, int id) async {
    var token = prefs.read("authToken");
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer $token"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.put(
        Uri.https(appUrl, 'api/loan-duration/update/$id').toString(),
        data: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> search(String search) async {
    var token = prefs.read("authToken");
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer $token"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.get(
        Uri.https(appUrl, 'api/loan-duration/search/$search').toString(),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<dynamic> delete(int id) async {
    var token = prefs.read("authToken");
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer $token"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.get(
        Uri.https(appUrl, 'api/loan-duration/delete/single/$id').toString(),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }

  @override
  Future<dynamic> deleteMultiple(List<int> ids) async {
    var token = prefs.read("authToken");
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer $token"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.delete(
        Uri.https(appUrl, 'api/loan-duration/delete/multiple/$ids').toString(),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Error();
      }
    } finally {
      dio.close();
    }
  }
}
