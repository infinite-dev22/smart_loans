import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:smart_loans/config/web_config.dart';
import 'package:smart_loans/data_source/daos/interfaces/loan_schedule_dao.dart';
import 'package:smart_loans/global_values.dart';

class LoanScheduleDaoImpl extends LoanScheduleDao {
  @override
  Future<Map<String, dynamic>> fetch(int id) async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${currentUser.token}"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.get(
        Uri.https(appUrl, 'api/loanschedule/show/$id').toString(),
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
  Future<List<dynamic>> fetchAll(int loanId) async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${currentUser.token}"; // Add server auth token here.
      dio.options.followRedirects = false;

      print(loanId);

      var response = await dio.get(
        Uri.https(appUrl, 'api/loanschedule/show/$loanId').toString(),
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
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${currentUser.token}"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.post(
        Uri.https(appUrl, 'api/loanschedule/create').toString(),
        data: jsonEncode(data),
      );

      print(response.statusCode);
      print(response.data);

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
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${currentUser.token}"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.put(
        Uri.https(appUrl, 'api/loanschedule/update/$id').toString(),
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
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${currentUser.token}"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.get(
        Uri.https(appUrl, 'api/loanschedule/search/$search').toString(),
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
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${currentUser.token}"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.get(
        Uri.https(appUrl, 'api/deleteLoanSchedule/$id').toString(),
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
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["authorization"] =
          "Bearer ${currentUser.token}"; // Add server auth token here.
      dio.options.followRedirects = false;

      var response = await dio.delete(
        Uri.https(appUrl, 'api/loanschedule/delete/multiple/$ids').toString(),
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
