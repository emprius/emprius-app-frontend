
import 'package:empriusapp/src/core/helper/constants/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';

import 'user_info/user_info_model.dart';
part 'booking_model.freezed.dart';
part 'booking_model.g.dart';



@freezed
class BookingModel with _$BookingModel{

  const factory BookingModel({
    int? bookingId,
    int? toolId,
    double? emps,
    DateTime? startDate,
    DateTime? endDate,
    @TimestampOrNullConverter() DateTimeRange? reservedDates,
    int? fromUserId,
    int? toUserId,
    UserInfo? userInfo,
    required String contact,
    required BookingStatus bookingStatus,
    String? comments
}) = _BookingModel;


factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

}


class TimestampOrNullConverter implements JsonConverter<DateTimeRange?, String?> {
  const TimestampOrNullConverter();

  @override
  DateTimeRange? fromJson(String? string) {
    return new DateTimeRange(start: DateTime.now(), end:  DateTime.now());
  }

  @override
  String? toJson(DateTimeRange? date) => date == null ? null : getFormattedDate(date.start);
}
