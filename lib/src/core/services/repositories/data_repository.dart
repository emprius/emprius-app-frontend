import 'package:empriusapp/src/core/services/repositories/endpoints_data.dart';
import 'package:empriusapp/src/core/services/networking/api.dart';
import 'package:empriusapp/src/core/services/networking/api_service.dart';
import 'package:empriusapp/src/core/services/networking/data_cache_service.dart';
import 'package:empriusapp/src/core/services/networking/endpoint_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class DataRepository {
  DataRepository({required this.apiService, required this.dataCacheService});
  final APIService apiService;
  final DataCacheService dataCacheService;

  late String _accessToken;

  Future<EndpointData> getEndpointData(Endpoint endpoint) async =>
      await _getDataRefreshingToken<EndpointData>(
        onGetData: () => apiService.getEndpointData(
            accessToken: _accessToken, endpoint: endpoint),
      );

  EndpointsData getAllEndpointsCachedData() => dataCacheService.getData();

  Future<EndpointsData> getAllEndpointsData() async {
    final endpointsData = await _getDataRefreshingToken<EndpointsData>(
      onGetData: _getAllEndpointsData,
    );
    // save to cache
    await dataCacheService.setData(endpointsData);
    return endpointsData;
  }

  Future<T> _getDataRefreshingToken<T>({required Future<T> Function() onGetData}) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await onGetData();
    } on Response catch (response) {
      // if unauthorized, get access token again
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await onGetData();
      }
      rethrow;
    }
  }

  Future<EndpointsData> _getAllEndpointsData() async {
    final values = await Future.wait([
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.users),
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.tools),
      apiService.getEndpointData(
          accessToken: _accessToken, endpoint: Endpoint.bookings),
    ]);
    return EndpointsData(
      values: {
        Endpoint.users: values[0],
        Endpoint.tools: values[1],
        Endpoint.bookings: values[2],
      },
    );
  }
}