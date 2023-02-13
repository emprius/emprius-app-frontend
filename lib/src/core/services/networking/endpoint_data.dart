import 'package:flutter/foundation.dart';

class EndpointData {
  EndpointData({required this.value, required this.date});
  final int value;
  final DateTime? date;

  @override
  String toString() => 'date: $date, value: $value';
}