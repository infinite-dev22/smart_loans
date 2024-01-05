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

String appUrl = "loansbackend.smartcase.co.ug";
String authToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNzFkZDliYjE2NTc4ZDg2NGFmZDAzNWFkZDFjZDZmYjhiMThkYTcxZWQ2YjhkMjljNzlkOTgxMDI1OGM2YzExMmMyYjkwMjRjZDEwYzI3MjEiLCJpYXQiOjE3MDQ0NTEyNDMuODI3NzUsIm5iZiI6MTcwNDQ1MTI0My44Mjc3NTQsImV4cCI6MTczNjA3MzY0My44MjIxMTIsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.TxrknbmNEnx45yjPzG0KNeUd-U4pAARrwKUkhq-vrQOCafRWeuwUmQGPFjK1vMGNU5Vy_OL5GpXxDkUHjcaP5l1mEcHQ4OnopHmwu5sNq8yQUpOZ1ar5c04SawvTSwXe_4rDXRUKF6RcjMVlIffZDJE8Wnw9eN2_PfejtWUFC0XF9b9hMtMVm4Zi2ECpyckpOpZB9iSPeq0abnLWZ4ng7jsm9ZXM2yrDWwQC-8ljp9lwKADPOCQtDvL9cs9stq9FSj6sCVb7X6PtYz4rGdHGAt6Jd9GHZJxljX_Gg0qqxVkSbVMhzynpZ00n2bEBDDO0hVxk0HIo0o4FmErOa-tz1Yl-mpTna3TmgOsH8iKz5_4jjrSTs1keqqDIdTzgI0o73amUIJ9vRkW1BPjokPly3BMAS6vDCpoaD1kTHjfYDL1adhKINN6eVeic-zWZJAvomCswPgjcPMAyd-LrKlqjaqq6LS6emWhpxDYPzP7_FqldwHECfcpoDopY_G1stXBilhTpS9qbGW7kF6pB3tzivduOTs92vc7Dvmk_hmLNZASjKOI46oY0XNlV6oKrnt2lmdZnzURaMEpypAReFM1rJen2Wwr_OERluUGS8FAH8fYTzOIECErDGuBlEiAL_lbf0u019rUZg0TiLKhlUYAzI9_yJCGCCQUyypgqFMWunRw";
