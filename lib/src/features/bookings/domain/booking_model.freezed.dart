// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  int? get bookingId => throw _privateConstructorUsedError;
  int? get toolId => throw _privateConstructorUsedError;
  double? get emps => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  @TimestampOrNullConverter()
  DateTimeRange? get reservedDates => throw _privateConstructorUsedError;
  int? get fromUserId => throw _privateConstructorUsedError;
  int? get toUserId => throw _privateConstructorUsedError;
  UserInfo? get userInfo => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  BookingStatus get bookingStatus => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) then) =
      _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call(
      {int? bookingId,
      int? toolId,
      double? emps,
      DateTime? startDate,
      DateTime? endDate,
      @TimestampOrNullConverter() DateTimeRange? reservedDates,
      int? fromUserId,
      int? toUserId,
      UserInfo? userInfo,
      String contact,
      BookingStatus bookingStatus,
      String? comments});

  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? toolId = freezed,
    Object? emps = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? reservedDates = freezed,
    Object? fromUserId = freezed,
    Object? toUserId = freezed,
    Object? userInfo = freezed,
    Object? contact = null,
    Object? bookingStatus = null,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      toolId: freezed == toolId
          ? _value.toolId
          : toolId // ignore: cast_nullable_to_non_nullable
              as int?,
      emps: freezed == emps
          ? _value.emps
          : emps // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservedDates: freezed == reservedDates
          ? _value.reservedDates
          : reservedDates // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      fromUserId: freezed == fromUserId
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      toUserId: freezed == toUserId
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      bookingStatus: null == bookingStatus
          ? _value.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BookingModelCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$_BookingModelCopyWith(
          _$_BookingModel value, $Res Function(_$_BookingModel) then) =
      __$$_BookingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? bookingId,
      int? toolId,
      double? emps,
      DateTime? startDate,
      DateTime? endDate,
      @TimestampOrNullConverter() DateTimeRange? reservedDates,
      int? fromUserId,
      int? toUserId,
      UserInfo? userInfo,
      String contact,
      BookingStatus bookingStatus,
      String? comments});

  @override
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$$_BookingModelCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$_BookingModel>
    implements _$$_BookingModelCopyWith<$Res> {
  __$$_BookingModelCopyWithImpl(
      _$_BookingModel _value, $Res Function(_$_BookingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? toolId = freezed,
    Object? emps = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? reservedDates = freezed,
    Object? fromUserId = freezed,
    Object? toUserId = freezed,
    Object? userInfo = freezed,
    Object? contact = null,
    Object? bookingStatus = null,
    Object? comments = freezed,
  }) {
    return _then(_$_BookingModel(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int?,
      toolId: freezed == toolId
          ? _value.toolId
          : toolId // ignore: cast_nullable_to_non_nullable
              as int?,
      emps: freezed == emps
          ? _value.emps
          : emps // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reservedDates: freezed == reservedDates
          ? _value.reservedDates
          : reservedDates // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
      fromUserId: freezed == fromUserId
          ? _value.fromUserId
          : fromUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      toUserId: freezed == toUserId
          ? _value.toUserId
          : toUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      bookingStatus: null == bookingStatus
          ? _value.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingModel implements _BookingModel {
  const _$_BookingModel(
      {this.bookingId,
      this.toolId,
      this.emps,
      this.startDate,
      this.endDate,
      @TimestampOrNullConverter() this.reservedDates,
      this.fromUserId,
      this.toUserId,
      this.userInfo,
      required this.contact,
      required this.bookingStatus,
      this.comments});

  factory _$_BookingModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookingModelFromJson(json);

  @override
  final int? bookingId;
  @override
  final int? toolId;
  @override
  final double? emps;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  @TimestampOrNullConverter()
  final DateTimeRange? reservedDates;
  @override
  final int? fromUserId;
  @override
  final int? toUserId;
  @override
  final UserInfo? userInfo;
  @override
  final String contact;
  @override
  final BookingStatus bookingStatus;
  @override
  final String? comments;

  @override
  String toString() {
    return 'BookingModel(bookingId: $bookingId, toolId: $toolId, emps: $emps, startDate: $startDate, endDate: $endDate, reservedDates: $reservedDates, fromUserId: $fromUserId, toUserId: $toUserId, userInfo: $userInfo, contact: $contact, bookingStatus: $bookingStatus, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingModel &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.toolId, toolId) || other.toolId == toolId) &&
            (identical(other.emps, emps) || other.emps == emps) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reservedDates, reservedDates) ||
                other.reservedDates == reservedDates) &&
            (identical(other.fromUserId, fromUserId) ||
                other.fromUserId == fromUserId) &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.bookingStatus, bookingStatus) ||
                other.bookingStatus == bookingStatus) &&
            (identical(other.comments, comments) ||
                other.comments == comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      toolId,
      emps,
      startDate,
      endDate,
      reservedDates,
      fromUserId,
      toUserId,
      userInfo,
      contact,
      bookingStatus,
      comments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingModelCopyWith<_$_BookingModel> get copyWith =>
      __$$_BookingModelCopyWithImpl<_$_BookingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingModelToJson(
      this,
    );
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel(
      {final int? bookingId,
      final int? toolId,
      final double? emps,
      final DateTime? startDate,
      final DateTime? endDate,
      @TimestampOrNullConverter() final DateTimeRange? reservedDates,
      final int? fromUserId,
      final int? toUserId,
      final UserInfo? userInfo,
      required final String contact,
      required final BookingStatus bookingStatus,
      final String? comments}) = _$_BookingModel;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$_BookingModel.fromJson;

  @override
  int? get bookingId;
  @override
  int? get toolId;
  @override
  double? get emps;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  @TimestampOrNullConverter()
  DateTimeRange? get reservedDates;
  @override
  int? get fromUserId;
  @override
  int? get toUserId;
  @override
  UserInfo? get userInfo;
  @override
  String get contact;
  @override
  BookingStatus get bookingStatus;
  @override
  String? get comments;
  @override
  @JsonKey(ignore: true)
  _$$_BookingModelCopyWith<_$_BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
