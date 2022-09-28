
import 'package:empriusapp/src/core/common_widgets/status_label.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter/foundation.dart';

@JsonEnum()
enum BookingStatus{
  @JsonValue('Asked') ASKED,
  @JsonValue('Approved') APPROVED,
  @JsonValue('Returned') RETURNED,
  @JsonValue('Returned') ALL,
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

  Object? get label {
    switch(this){
      case BookingStatus.ASKED:
        return StatusLabel(
          color: Colors.redAccent,
        );
      case BookingStatus.APPROVED:
        return StatusLabel(
          color: Colors.purple,
        );
      case BookingStatus.RETURNED:
        return StatusLabel(
          color: Colors.green,
        );
      // case BookingStatus.ALL:
      //   return StatusLabel(
      //     color: Colors.blueAccent,
      //     icon: Icons.workspaces_sharp,
      //     // text: '',
      //   );
      default:
        return null;
    }
  }

}