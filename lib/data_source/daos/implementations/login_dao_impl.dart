import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:smart_loans/config/web_config.dart';
import 'package:smart_loans/data_source/daos/interfaces/login_dao.dart';

class LoginDaoImpl extends LoginDao {
  @override
  Future post(Map<String, dynamic> data) async {
    Dio dio = Dio(baseOps)
      ..interceptors.add(DioCacheInterceptor(options: options));

    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.followRedirects = false;

      var response = await dio.post(
        Uri.https(appUrl, 'api/login').toString(),
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
}
