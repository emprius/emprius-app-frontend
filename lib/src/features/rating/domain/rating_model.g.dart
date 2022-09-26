// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RatingModel _$$_RatingModelFromJson(Map<String, dynamic> json) =>
    _$_RatingModel(
      ratingId: json['ratingId'] as int?,
      isPending: json['isPending'] as bool?,
      fromUserId: json['fromUserId'] as int?,
      toUserId: json['toUserId'] as int?,
      thumbnail: json['thumbnail'] as String?,
      title: json['title'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      bookingId: json['bookingId'] as int?,
      ratingType: $enumDecodeNullable(_$RatingTypeEnumMap, json['ratingType']),
      bookingReservedDates: json['bookingReservedDates'] == null
          ? const []
          : const TimestampListOrNullConverter()
              .fromJson(json['bookingReservedDates'] as List<String>),
    );

Map<String, dynamic> _$$_RatingModelToJson(_$_RatingModel instance) =>
    <String, dynamic>{
      'ratingId': instance.ratingId,
      'isPending': instance.isPending,
      'fromUserId': instance.fromUserId,
      'toUserId': instance.toUserId,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'rating': instance.rating,
      'bookingId': instance.bookingId,
      'ratingType': _$RatingTypeEnumMap[instance.ratingType],
      'bookingReservedDates': const TimestampListOrNullConverter()
          .toJson(instance.bookingReservedDates),
    };

const _$RatingTypeEnumMap = {
  RatingType.TOOL_RATE: 'Tool',
  RatingType.USER_RATE: 'User',
};
