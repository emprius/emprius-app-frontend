import 'package:empriusapp/src/core/services/networking/api_keys.dart';
import 'package:flutter/foundation.dart';

/// List all endpoints when querying our bse url:

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  API({required this.apiKey});
  final String apiKey;

  //factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  /// add server here:
  static final String host = '';

  /// define resource identifier we will use to get the access token:
  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _paths[endpoint],
      );

  static final Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}