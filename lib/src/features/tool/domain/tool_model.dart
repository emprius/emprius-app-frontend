import 'package:empriusapp/src/core/helper/utils/date_utils.dart';
import 'package:empriusapp/src/features/tool/domain/enums/tool_category_enum.dart';
import 'package:empriusapp/src/features/tool/domain/enums/transport_options_enum.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tool_model.freezed.dart';
part 'tool_model.g.dart';

@freezed
class ToolModel with _$ToolModel {
  const factory ToolModel({
   int? id,
   required String title,
   required String description,
   @Default(true)bool isAvailable,
   bool? maybeFree,
   int? cost,
   int? userId,
   List<String>? images,
   TransportOptions? transportOptions,
   ToolCategory? toolCategory,
   bool? askWithFee,
   LatLng? location,
   int? rating,
   double? estimatedValue,
   double? height,
   double? width,
   double? length,
   double? weight,
   @TimestampListOrNullConverter() @Default([])List<DateTimeRange> reservedDates,
   //List<DateTimeRange>? reservedDates,
  }) = _ToolModel;

  factory ToolModel.fromJson(Map<String, dynamic> json) => _$ToolModelFromJson(json);
}


class TimestampListOrNullConverter implements JsonConverter<List<DateTimeRange>,List<String>> {
 const TimestampListOrNullConverter();

 @override
 List<DateTimeRange> fromJson(List<String> reservedDates) {
  return[ DateTimeRange(start: DateTime.now(), end:  DateTime.now())];
 }

 @override
 List<String> toJson(List<DateTimeRange?> date) => [''];
}
