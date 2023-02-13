import 'dart:convert';

import 'package:empriusapp/src/core/services/networking/api.dart';
import 'package:empriusapp/src/core/services/networking/endpoint_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


/// uses http package to make requests:

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async {
    final response = await http.post(
      /// the first argument is the url we want to use:
      api.tokenUri(),
      headers: {'Authorization': 'Basic ${api.apiKey}'},
    );

    /// handle 200 status:
    if (response.statusCode == 200) {
      /// payload - decode from convert parses de json and returns a map of key value pairs:
      final data = json.decode(response.body);
      /// here we use 'access_token' as a key for the map of the response
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    /// handle error:
    print(
        'Request ${api.tokenUri()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

  /// Parse data in the response:
  Future<EndpointData> getEndpointData({
    required String accessToken,
    required Endpoint endpoint,
  }) async {
    final uri = api.endpointUri(endpoint);
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        final Map<String, dynamic> endpointData = data[0];
        final String? responseJsonKey = _responseJsonKeys[endpoint];
        final int value = endpointData[responseJsonKey];
        final String dateString = endpointData['date'];
        final date = DateTime.tryParse(dateString);
        if (value != null) {
          return EndpointData(value: value, date: date);
        }
      }
    }
    print(
        'Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

  static final Map<Endpoint, String> _responseJsonKeys = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'data',
    Endpoint.casesConfirmed: 'data',
    Endpoint.deaths: 'data',
    Endpoint.recovered: 'data',
  };
}