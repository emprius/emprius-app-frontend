
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';

@JsonEnum()
enum BookingStatus{
  @JsonValue('Asked') ASKED,
  @JsonValue('Approved') APPROVED,
  @JsonValue('Returned') RETURNED,
}

extension ExtBookingStatus on BookingStatus{
  String get name => describeEnum(this);

  String? get displayStatus{
    switch(this){
      case BookingStatus.ASKED:
        return 'Demanada';
      case BookingStatus.APPROVED:
        return 'Acceptada';
      case BookingStatus.RETURNED:
        return 'Retornada';
      default:
        return null;
    }
  }

}