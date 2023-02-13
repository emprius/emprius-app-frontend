import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

final baseOptions = BaseOptions(
  baseUrl: "www.sample-url.com",
);

final _cacheOptions = CacheOptions(
  store: HiveCacheStore(pp.getApplicationDocumentsDirectory()),
  policy: CachePolicy.noCache, // Bcz we force cache on-demand in repositories
  maxStale: const Duration(days: 30), // No of days cache is valid
  keyBuilder: (options) => options.path,
);

DioService(
  dioClient: _dio,
  globalCacheOptions: _cacheOptions,
  interceptors: [
    // Order of interceptors very important
    ApiInterceptor(),
    DioCacheInterceptor(options: _cacheOptions),
    if (kDebugMode) LoggingInterceptor(),
    RefreshTokenInterceptor()
] ,
);