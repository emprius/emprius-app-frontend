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
      reservedDates: const TimestampOrNullConverter()
          .fromJson(json['reservedDates'] as String?),
      fromUserId: json['fromUserId'] as int?,
      toUserId: json['toUserId'] as int?,
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
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
      'reservedDates':
          const TimestampOrNullConverter().toJson(instance.reservedDates),
      'fromUserId': instance.fromUserId,
      'toUserId': instance.toUserId,
      'userInfo': instance.userInfo,
      'contact': instance.contact,
      'bookingStatus': _$BookingStatusEnumMap[instance.bookingStatus]!,
      'comments': instance.comments,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.ASKED: 'Asked',
  BookingStatus.APPROVED: 'Approved',
  BookingStatus.RETURNED: 'Returned',
  BookingStatus.ALL: 'Returned',
};
