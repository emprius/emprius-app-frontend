// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  bool? get isPending => throw _privateConstructorUsedError;
  int? get fromUserId => throw _privateConstructorUsedError;
  int? get toUserId => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
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
      _$RatingModelCopyWithImpl<$Res>;
  $Res call(
      {int? ratingId,
      bool? isPending,
      int? fromUserId,
      int? toUserId,
      String? thumbnail,
      String? title,
      int? rating,
      int? bookingId,
      RatingType? ratingType,
      @TimestampListOrNullConverter()
          List<DateTimeRange> bookingReservedDates});
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res> implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  final RatingModel _value;
  // ignore: unused_field
  final $Res Function(RatingModel) _then;

  @override
  $Res call({
    Object? ratingId = freezed,
    Object? isPending = freezed,
    Object? fromUserId = freezed,
    Object? toUserId = freezed,
    Object? thumbnail = freezed,
    Object? title = freezed,
    Object? rating = freezed,
    Object? bookingId = freezed,
    Object? ratingType = freezed,
    Object? bookingReservedDates = freezed,
  }) {
    return _then(_value.copyWith(
      ratingId: ratingId == freezed
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool?,
      fromUserId: fromUserId == freezed
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      toUserId: toUserId == freezed
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingId: bookingId == freezed
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingType: ratingType == freezed
          ? _value.ratingType
          : ratingType // ignore: cast_nullable_to_non_nullable
              as RatingType?,
      bookingReservedDates: bookingReservedDates == freezed
          ? _value.bookingReservedDates
          : bookingReservedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTimeRange>,
    ));
  }
}

/// @nodoc
abstract class _$$_RatingModelCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$$_RatingModelCopyWith(
          _$_RatingModel value, $Res Function(_$_RatingModel) then) =
      __$$_RatingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? ratingId,
      bool? isPending,
      int? fromUserId,
      int? toUserId,
      String? thumbnail,
      String? title,
      int? rating,
      int? bookingId,
      RatingType? ratingType,
      @TimestampListOrNullConverter()
          List<DateTimeRange> bookingReservedDates});
}

/// @nodoc
class __$$_RatingModelCopyWithImpl<$Res> extends _$RatingModelCopyWithImpl<$Res>
    implements _$$_RatingModelCopyWith<$Res> {
  __$$_RatingModelCopyWithImpl(
      _$_RatingModel _value, $Res Function(_$_RatingModel) _then)
      : super(_value, (v) => _then(v as _$_RatingModel));

  @override
  _$_RatingModel get _value => super._value as _$_RatingModel;

  @override
  $Res call({
    Object? ratingId = freezed,
    Object? isPending = freezed,
    Object? fromUserId = freezed,
    Object? toUserId = freezed,
    Object? thumbnail = freezed,
    Object? title = freezed,
    Object? rating = freezed,
    Object? bookingId = freezed,
    Object? ratingType = freezed,
    Object? bookingReservedDates = freezed,
  }) {
    return _then(_$_RatingModel(
      ratingId: ratingId == freezed
          ? _value.ratingId
          : ratingId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPending: isPending == freezed
          ? _value.isPending
          : isPending // ignore: cast_nullable_to_non_nullable
              as bool?,
      fromUserId: fromUserId == freezed
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      toUserId: toUserId == freezed
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      bookingId: bookingId == freezed
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingType: ratingType == freezed
          ? _value.ratingType
          : ratingType // ignore: cast_nullable_to_non_nullable
              as RatingType?,
      bookingReservedDates: bookingReservedDates == freezed
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
      this.isPending,
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
  final bool? isPending;
  @override
  final int? fromUserId;
  @override
  final int? toUserId;
  @override
  final String? thumbnail;
  @override
  final String? title;
  @override
  final int? rating;
  @override
  final int? bookingId;
  @override
  final RatingType? ratingType;
  final List<DateTimeRange> _bookingReservedDates;
  @override
  @JsonKey()
  @TimestampListOrNullConverter()
  List<DateTimeRange> get bookingReservedDates {
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
            const DeepCollectionEquality().equals(other.ratingId, ratingId) &&
            const DeepCollectionEquality().equals(other.isPending, isPending) &&
            const DeepCollectionEquality()
                .equals(other.fromUserId, fromUserId) &&
            const DeepCollectionEquality().equals(other.toUserId, toUserId) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.bookingId, bookingId) &&
            const DeepCollectionEquality()
                .equals(other.ratingType, ratingType) &&
            const DeepCollectionEquality()
                .equals(other._bookingReservedDates, _bookingReservedDates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ratingId),
      const DeepCollectionEquality().hash(isPending),
      const DeepCollectionEquality().hash(fromUserId),
      const DeepCollectionEquality().hash(toUserId),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(bookingId),
      const DeepCollectionEquality().hash(ratingType),
      const DeepCollectionEquality().hash(_bookingReservedDates));

  @JsonKey(ignore: true)
  @override
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
      final bool? isPending,
      final int? fromUserId,
      final int? toUserId,
      final String? thumbnail,
      final String? title,
      final int? rating,
      final int? bookingId,
      final RatingType? ratingType,
      @TimestampListOrNullConverter()
          final List<DateTimeRange> bookingReservedDates}) = _$_RatingModel;

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$_RatingModel.fromJson;

  @override
  int? get ratingId;
  @override
  bool? get isPending;
  @override
  int? get fromUserId;
  @override
  int? get toUserId;
  @override
  String? get thumbnail;
  @override
  String? get title;
  @override
  int? get rating;
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
