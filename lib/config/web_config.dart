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

String urlVariableHere = "127.0.0.1:8000";
String authToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGMwYjJiNDA4NWZhODBmMWMxZTM4YWM2NjFjZTZmNDI4NzA4MTkyNWU0OTNmZmM0ZDQwNjM5MzFiNmM0MTAwODk1NzQ3OTQ3MWQ0NDBjZjEiLCJpYXQiOjE3MDQxOTY2MjguMzU4MzA3LCJuYmYiOjE3MDQxOTY2MjguMzU4MzE3LCJleHAiOjE3MzU4MTkwMjcuNzcwNjI0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.dbhkT6Kd9Fl72uTI0r1QcRx8vfZzW8HPm8kXAPxPaxug6Tv2ukyqIjG7ieQNkghrpXU4EBrWwQCqXOPX85DGRx6ZiofXJ10kFf0kfY53dub4HhgLjSYt4bv5YOczIc-vgtc_DZ3qvEtb4-hiHA-dJKGvTpYFw0OkYP5alqSTtWD5ZzfoA7X5nMPqS7xOsJiOyIci6cUy7WkZpIiIaYFwQW9nfIQ2X9w21lfoYOatFPrcoqUuarPKS0iQbsYLgUSGMCak9Oae_ZDnUtNG9taVR5qxVzEouuv1o9oNY8kOIWNg-DdewZUxacHieGMsYBIt7xTLUihYjy7Yh1F7asbhT-ddsTRbtEELBQH2T-WMJoFJ40JQjsrU6YbwInlRFHtWE_HKASXvCpqRFZ3Ic41umZm94UFWTbrrrGzOxLt9Unw4P-fGi8a5K36f6bSK5m1t15ZSuTV128Sz2K71xf6XlaROOhiVFL1hGGCgP-JBU-Nim8wf8aQanUUh2S981DTntsyeeZ5SNjyMGHPBqgh7CNav3-vBenUz0PLxrtejK22pFGMxZ0RDlOycbHozbdhOetKJ4ocQs5pplAMsj92JhWoOirqQgEOicl_EuTnLfCX0lVXxER-Qtx9CaWqDDY7VwVf_Rn9WGA7U3DqKfjCr1MEaxlCGG70kpw9FTi1Ehow";