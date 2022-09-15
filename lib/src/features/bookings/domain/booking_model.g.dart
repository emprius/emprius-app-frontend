// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingModel _$$_BookingModelFromJson(Map<String, dynamic> json) =>
    _$_BookingModel(
      bookingId: json['bookingId'] as int?,
      toolId: json['toolId'] as int?,
      emps: (json['emps'] as num?)?.toDouble(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      fromUserId: json['fromUserId'] as int?,
      toUserId: json['toUserId'] as int?,
      contact: json['contact'] as String,
      bookingStatus: $enumDecode(_$BookingStatusEnumMap, json['bookingStatus']),
      comments: json['comments'] as String?,
    );

Map<String, dynamic> _$$_BookingModelToJson(_$_BookingModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'toolId': instance.toolId,
      'emps': instance.emps,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'fromUserId': instance.fromUserId,
      'toUserId': instance.toUserId,
      'contact': instance.contact,
      'bookingStatus': _$BookingStatusEnumMap[instance.bookingStatus]!,
      'comments': instance.comments,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.ASKED: 'Asked',
  BookingStatus.APPROVED: 'Approved',
  BookingStatus.RETURNED: 'Returned',
};
