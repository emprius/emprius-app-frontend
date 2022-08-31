import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum TransportOptions{
  @JsonValue('Not_necessary') NOT_NECESSARY,
  @JsonValue('Extra_necessary') EXTRA_NECESSARY,
  @JsonValue('Necessary') NECESSARY
}

extension ExtTransportOptions on TransportOptions{
  String get name => describeEnum(this);
  String? get displayName {
    switch (this) {
      case TransportOptions.NOT_NECESSARY:
        return 'Cap en especial';
      case TransportOptions.EXTRA_NECESSARY:
        return 'Necessita remolc';
      case TransportOptions.NECESSARY:
        return 'Necessita vehicle pesat';
      default:
        return null;
    }
  }
}