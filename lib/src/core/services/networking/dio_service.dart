import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

// Exceptions

// Helpers
import 'package:empriusapp/src/core/helper/utils/typedefs.dart';

// Models

/// A wrapper class around Dio package:
class DioService {
  /// An instance of [Dio] for executing network requests.
  final Dio _dio;

  /// A set of cache options to be used for each request.
  final CacheOptions? globalCacheOptions;

  /// An instance of [CancelToken] used to pre-maturely cancel
  /// network requests.
  final CancelToken _cancelToken;

  /// A public constructor to initialize these variables
  /// and create a Dio service:
  ///
  /// * [interceptors]: A List of Interceptors for attaching custom
  /// [Interceptor]s to the underlying [_dio] client/object that are used
  /// for purposes like logging, refreshing token and error handling.
  ///
  /// * [httpClientAdapter]: Optional - Replaces the underlying adapter for Dio
  /// [HttpClientAdapter] with this custom one:
  /// is used to force usage of HTTP 2.0 protocol.
  ///
  DioService({
    required Dio dioClient,
    this.globalCacheOptions,
    Iterable<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  })
      : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    if (httpClientAdapter != null) _dio.httpClientAdapter = httpClientAdapter;
  }

  /// This method invokes the [cancel()] method on either the input
  /// [cancelToken] or internal [_cancelToken] to pre-maturely end all
  /// requests attached to this token.
  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  /// The followig methods request to the [endpoint] and return the
  /// **decoded** response.
  ///
  /// Any errors encountered during the request are caught and a custom
  /// [NetworkException] is thrown.
  ///
  /// [queryParams] GET method only: Instead of data it uses
  /// a set of query params that are added to the url internally.
  ///
  /// [cacheOptions] decides the caching strategy for this specific request
  /// and merges it with the global one and overrides the common settings.
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the specific request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request,
  /// used to add headers, set custom timeouts, etc.

  Future<ResponseModel<R>> get<R>({
    required String endpoint,
    JSON? queryParams,
    Options? options,
    CacheOptions? cacheOptions,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<JSON>(
      endpoint,
      queryParameters: queryParams,
      options: _mergeDioAndCacheOptions(
        dioOptions: options,
        cacheOptions: cacheOptions,
      ),
      cancelToken: cancelToken ?? _cancelToken,
    );
    return ResponseModel<R>.fromJson(response.data!);
  }

  Future<ResponseModel<R>> post<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<JSON>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return ResponseModel<R>.fromJson(response.data!);
  }

  Future<ResponseModel<R>> patch<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.patch<JSON>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return ResponseModel<R>.fromJson(response.data!);
  }

  Future<ResponseModel<R>> delete<R>({
    required String endpoint,
    JSON? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete<JSON>(
      endpoint,
      data: data,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return ResponseModel<R>.fromJson(response.data!);
  }

  /// A utility method used to merge together [Options]
  /// and [CacheOptions] since dio required an Options object only:
  ///
  /// Returns an [Options] object with [CacheOptions] stored
  /// in the [options.extra] key.
  Options? _mergeDioAndCacheOptions({
    Options? dioOptions,
    CacheOptions? cacheOptions,
  }) {
    if (dioOptions == null && cacheOptions == null) {
      return null;
    } else if (dioOptions == null && cacheOptions != null) {
      return cacheOptions.toOptions();
    } else if (dioOptions != null && cacheOptions == null) {
      return dioOptions;
    }

    final _cacheOptionsMap = cacheOptions!.toExtra();
    final options = dioOptions!.copyWith(
      extra: <String, dynamic>{...dioOptions.extra!, ..._cacheOptionsMap},
    );
    return options;
  }
}