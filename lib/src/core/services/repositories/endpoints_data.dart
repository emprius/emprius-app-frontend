import 'package:empriusapp/src/core/services/networking/api.dart';
import 'package:empriusapp/src/core/services/networking/endpoint_data.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  EndpointsData({required this.values});
  final Map<Endpoint, EndpointData> values;
  EndpointData? get users => values[Endpoint.users];
  EndpointData? get tools => values[Endpoint.tools];
  EndpointData? get bookings => values[Endpoint.bookings];
/*

  @override
  String toString() =>
      'cases: $cases, suspected: $casesSuspected, confirmed: $casesConfirmed, deaths: $deaths, recovered: $recovered';
*/

}