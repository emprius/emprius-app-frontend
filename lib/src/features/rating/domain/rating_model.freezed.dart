// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) {
  return _RatingModel.fromJson(json);
}

/// @nodoc
mixin _$RatingModel {
  int? get ratingId => throw _privateConstructorUsedError;
  bool get isPending => throw _privateConstructorUsedError;
  int? get fromUserId => throw _privateConstructorUsedError;
  int? get toUserId => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int? get bookingId => throw _privateConstructorUsedError;
  RatingType? get ratingType => throw _privateConstructorUsedError;
  @TimestampListOrNullConverter()
  List<DateTimeRange> get bookingReservedDates =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingModelCopyWith<RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingModelCopyWith<$Res> {
  factory $RatingModelCopyWith(
          RatingModel value, $Res Function(RatingModel) then) =
      _$RatingModelCopyWithImpl<$Res, RatingModel>;
  @useResult
  $Res call(
      {int? ratingId,
      bool isPending,
      int? fromUserId,
      int? toUserId,
      String? thumbnail,
      String? title,
      double? rating,
      int? bookingId,
      RatingType? ratingType,
      @TimestampListOrNullConverter()
          List<DateTimeRange> bookingReservedDates});
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res, $Val extends RatingModel>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingId = freezed,
    Object? isPending = null,
    Object? fromUserId = freezed,
    Object? toUserId = freezed,
    Object? thumbnail = freezed,
    Object? title = freezed,
    Object? rating = freezed,
    Object? bookingId = freezed,
    Object? ratingType = freezed,
    Object? bookingReservedDates = null,
  }) {
    return _then(_value.copyWith(
      ratingId: freezed == ratingId
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      fromUserId: freezed == fromUserId
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      toUserId: freezed == toUserId
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingType: freezed == ratingType
          ? _value.ratingType
          : ratingType // ignore: cast_nullable_to_non_nullable
              as RatingType?,
      bookingReservedDates: null == bookingReservedDates
          ? _value.bookingReservedDates
          : bookingReservedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTimeRange>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingModelCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$$_RatingModelCopyWith(
          _$_RatingModel value, $Res Function(_$_RatingModel) then) =
      __$$_RatingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? ratingId,
      bool isPending,
      int? fromUserId,
      int? toUserId,
      String? thumbnail,
      String? title,
      double? rating,
      int? bookingId,
      RatingType? ratingType,
      @TimestampListOrNullConverter()
          List<DateTimeRange> bookingReservedDates});
}

/// @nodoc
class __$$_RatingModelCopyWithImpl<$Res>
    extends _$RatingModelCopyWithImpl<$Res, _$_RatingModel>
    implements _$$_RatingModelCopyWith<$Res> {
  __$$_RatingModelCopyWithImpl(
      _$_RatingModel _value, $Res Function(_$_RatingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratingId = freezed,
    Object? isPending = null,
    Object? fromUserId = freezed,
    Object? toUserId = freezed,
    Object? thumbnail = freezed,
    Object? title = freezed,
    Object? rating = freezed,
    Object? bookingId = freezed,
    Object? ratingType = freezed,
    Object? bookingReservedDates = null,
  }) {
    return _then(_$_RatingModel(
      ratingId: freezed == ratingId
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPending: null == isPending
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool,
      fromUserId: freezed == fromUserId
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      toUserId: freezed == toUserId
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingType: freezed == ratingType
          ? _value.ratingType
          : ratingType // ignore: cast_nullable_to_non_nullable
              as RatingType?,
      bookingReservedDates: null == bookingReservedDates
          ? _value._bookingReservedDates
          : bookingReservedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTimeRange>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatingModel implements _RatingModel {
  const _$_RatingModel(
      {this.ratingId,
      this.isPending = true,
      this.fromUserId,
      this.toUserId,
      this.thumbnail,
      this.title,
      this.rating,
      this.bookingId,
      this.ratingType,
      @TimestampListOrNullConverter()
          final List<DateTimeRange> bookingReservedDates = const []})
      : _bookingReservedDates = bookingReservedDates;

  factory _$_RatingModel.fromJson(Map<String, dynamic> json) =>
      _$$_RatingModelFromJson(json);

  @override
  final int? ratingId;
  @override
  @JsonKey()
  final bool isPending;
  @override
  final int? fromUserId;
  @override
  final int? toUserId;
  @override
  final String? thumbnail;
  @override
  final String? title;
  @override
  final double? rating;
  @override
  final int? bookingId;
  @override
  final RatingType? ratingType;
  final List<DateTimeRange> _bookingReservedDates;
  @override
  @JsonKey()
  @TimestampListOrNullConverter()
  List<DateTimeRange> get bookingReservedDates {
    if (_bookingReservedDates is EqualUnmodifiableListView)
      return _bookingReservedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookingReservedDates);
  }

  @override
  String toString() {
    return 'RatingModel(ratingId: $ratingId, isPending: $isPending, fromUserId: $fromUserId, toUserId: $toUserId, thumbnail: $thumbnail, title: $title, rating: $rating, bookingId: $bookingId, ratingType: $ratingType, bookingReservedDates: $bookingReservedDates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingModel &&
            (identical(other.ratingId, ratingId) ||
                other.ratingId == ratingId) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending) &&
            (identical(other.fromUserId, fromUserId) ||
                other.fromUserId == fromUserId) &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.ratingType, ratingType) ||
                other.ratingType == ratingType) &&
            const DeepCollectionEquality()
                .equals(other._bookingReservedDates, _bookingReservedDates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ratingId,
      isPending,
      fromUserId,
      toUserId,
      thumbnail,
      title,
      rating,
      bookingId,
      ratingType,
      const DeepCollectionEquality().hash(_bookingReservedDates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingModelCopyWith<_$_RatingModel> get copyWith =>
      __$$_RatingModelCopyWithImpl<_$_RatingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingModelToJson(
      this,
    );
  }
}

abstract class _RatingModel implements RatingModel {
  const factory _RatingModel(
      {final int? ratingId,
      final bool isPending,
      final int? fromUserId,
      final int? toUserId,
      final String? thumbnail,
      final String? title,
      final double? rating,
      final int? bookingId,
      final RatingType? ratingType,
      @TimestampListOrNullConverter()
          final List<DateTimeRange> bookingReservedDates}) = _$_RatingModel;

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$_RatingModel.fromJson;

  @override
  int? get ratingId;
  @override
  bool get isPending;
  @override
  int? get fromUserId;
  @override
  int? get toUserId;
  @override
  String? get thumbnail;
  @override
  String? get title;
  @override
  double? get rating;
  @override
  int? get bookingId;
  @override
  RatingType? get ratingType;
  @override
  @TimestampListOrNullConverter()
  List<DateTimeRange> get bookingReservedDates;
  @override
  @JsonKey(ignore: true)
  _$$_RatingModelCopyWith<_$_RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
