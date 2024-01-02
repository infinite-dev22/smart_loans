import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final baseOps = BaseOptions(
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
);

final options = CacheOptions(
  // A default store is required for interceptor.
  store: MemCacheStore(),

  // All subsequent fields are optional.

  // Default.
  policy: CachePolicy.request,
  // Returns a cached response on error but for statuses 401 & 403.
  // Also allows to return a cached response on network errors (e.g. offline usage).
  // Defaults to [null].
  // hitCacheOnErrorExcept: [401, 403],
  // Overrides any HTTP directive to delete entry past this duration.
  // Useful only when origin server has no cache config or custom behaviour is desired.
  // Defaults to [null].
  // maxStale: const Duration(days: 7),
  // Default. Allows 3 cache sets and ease cleanup.
  priority: CachePriority.normal,
  // Default. Body and headers encryption with your own algorithm.
  // cipher: null,
  // Default. Key builder to retrieve requests.
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  // Default. Allows to cache POST requests.
  // Overriding [keyBuilder] is strongly recommended when [true].
  allowPostMethod: false,
);

String urlVariableHere = "http://127.0.0.1:8000/";
String authToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2RlNTEyNDAyNTBkZmQ5ODJlYzE3YWRiZjYwMDk3ZDM5Y2M0OTM4ZTgxZDAxYjk2OGZlY2Q5MGM3MWY5ZmIyNjE0YTg1OGI2NmM1OTU4YmMiLCJpYXQiOjE3MDQxODc0NzEuODEzNjM3LCJuYmYiOjE3MDQxODc0NzEuODEzNjQxLCJleHAiOjE3MzU4MDk4NzEuODAxNDE5LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.puhMhRT6IN2ukgxMiSfsSvum_sht_0hDaY-7LWAVOmjuw2pCH1ij50BHHVzQGwglKQYL5fK8ovbZW7Y-dHG8aepDdENuzXDp2AAH4ii0VLb4xCs9I3t0xdKWfvxj-miKNejUgXnzxvy3kQo8HHySU2GfKEZsz5rgcdyIAycnxfdUmTCOF3MTJbNbuYTnifHuw8iWS10eUQA4niZD3C9YU9wtf8BCyVUxDyxLoW618bWjwCFapipiDNbHzKf1CADUoAZzwPdxGcDAUshZ7SX0ZE5fzAER-ByLPT0FmoCqa8yYzU2zOVuktFfdaGVIbZtn3T73SQYrUGAG7W9aMR5FuFudaNv-JVVvO_LKZXtzg78VLnEfiEOpE4TMv634GQmeZZA0WIhLiXr1ZibiUlQakclXShLQkauzO5OPEmjcEIMuH2rAu-bMQBSiAsZqhyrGuXrzFjdFX9AnciDHJ63dHN8r16V0AbIfyZHIyLk50W06yaMuDDDoqbn7begxqsNK1B8ggV__QkljOB8Ah93yH3Kc3bia7ke5Knw4TzdmzflagnftUJ978gT4wd91qw2TRQWP3DWNzNandEhDtoxihz94vnX_NPbak1pwmf_0C3gau3NpQc4zQF_hMvU6EFTPXBRj3iar5Ph44r8huVNI25qNt8PCD5TzFL6MxSZEk3s";
