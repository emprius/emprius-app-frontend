import 'package:empriusapp/src/features/rating/domain/rating_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'rating_model.freezed.dart';
part 'rating_model.g.dart';


@freezed
class RatingModel with _$RatingModel {
  const factory RatingModel({
    int? ratingId,
    bool? isPending,
    int? fromUserId,
    int? toUserId,
    String? thumbnail,
    String? title,
    int? rating,
    int? bookingId,
    RatingType? ratingType,
    @TimestampListOrNullConverter() @Default([])List<DateTimeRange> bookingReservedDates,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);
}


class TimestampListOrNullConverter implements JsonConverter<List<DateTimeRange>,List<String>> {
  const TimestampListOrNullConverter();

  @override
  List<DateTimeRange> fromJson(List<String> bookingReservedDates) {
    return[ DateTimeRange(start: DateTime.now(), end:  DateTime.now())];
  }

  @override
  List<String> toJson(List<DateTimeRange?> date) => [''];
}
