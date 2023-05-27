// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToolModel _$ToolModelFromJson(Map<String, dynamic> json) {
  return _ToolModel.fromJson(json);
}

/// @nodoc
mixin _$ToolModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  bool? get maybeFree => throw _privateConstructorUsedError;
  int? get cost => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  TransportOptions? get transportOptions => throw _privateConstructorUsedError;
  ToolCategory? get toolCategory => throw _privateConstructorUsedError;
  bool? get askWithFee => throw _privateConstructorUsedError;
  LatLng? get location => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  double? get estimatedValue => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get width => throw _privateConstructorUsedError;
  double? get length => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  @TimestampListOrNullConverter()
  List<DateTimeRange> get reservedDates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolModelCopyWith<ToolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolModelCopyWith<$Res> {
  factory $ToolModelCopyWith(ToolModel value, $Res Function(ToolModel) then) =
      _$ToolModelCopyWithImpl<$Res, ToolModel>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String description,
      bool isAvailable,
      bool? maybeFree,
      int? cost,
      int? userId,
      List<String>? images,
      TransportOptions? transportOptions,
      ToolCategory? toolCategory,
      bool? askWithFee,
      LatLng? location,
      double? rating,
      double? estimatedValue,
      double? height,
      double? width,
      double? length,
      double? weight,
      @TimestampListOrNullConverter() List<DateTimeRange> reservedDates});
}

/// @nodoc
class _$ToolModelCopyWithImpl<$Res, $Val extends ToolModel>
    implements $ToolModelCopyWith<$Res> {
  _$ToolModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? isAvailable = null,
    Object? maybeFree = freezed,
    Object? cost = freezed,
    Object? userId = freezed,
    Object? images = freezed,
    Object? transportOptions = freezed,
    Object? toolCategory = freezed,
    Object? askWithFee = freezed,
    Object? location = freezed,
    Object? rating = freezed,
    Object? estimatedValue = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? length = freezed,
    Object? weight = freezed,
    Object? reservedDates = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      maybeFree: freezed == maybeFree
          ? _value.maybeFree
          : maybeFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      transportOptions: freezed == transportOptions
          ? _value.transportOptions
          : transportOptions // ignore: cast_nullable_to_non_nullable
              as TransportOptions?,
      toolCategory: freezed == toolCategory
          ? _value.toolCategory
          : toolCategory // ignore: cast_nullable_to_non_nullable
              as ToolCategory?,
      askWithFee: freezed == askWithFee
          ? _value.askWithFee
          : askWithFee // ignore: cast_nullable_to_non_nullable
              as bool?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      reservedDates: null == reservedDates
          ? _value.reservedDates
          : reservedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTimeRange>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ToolModelCopyWith<$Res> implements $ToolModelCopyWith<$Res> {
  factory _$$_ToolModelCopyWith(
          _$_ToolModel value, $Res Function(_$_ToolModel) then) =
      __$$_ToolModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String description,
      bool isAvailable,
      bool? maybeFree,
      int? cost,
      int? userId,
      List<String>? images,
      TransportOptions? transportOptions,
      ToolCategory? toolCategory,
      bool? askWithFee,
      LatLng? location,
      double? rating,
      double? estimatedValue,
      double? height,
      double? width,
      double? length,
      double? weight,
      @TimestampListOrNullConverter() List<DateTimeRange> reservedDates});
}

/// @nodoc
class __$$_ToolModelCopyWithImpl<$Res>
    extends _$ToolModelCopyWithImpl<$Res, _$_ToolModel>
    implements _$$_ToolModelCopyWith<$Res> {
  __$$_ToolModelCopyWithImpl(
      _$_ToolModel _value, $Res Function(_$_ToolModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? isAvailable = null,
    Object? maybeFree = freezed,
    Object? cost = freezed,
    Object? userId = freezed,
    Object? images = freezed,
    Object? transportOptions = freezed,
    Object? toolCategory = freezed,
    Object? askWithFee = freezed,
    Object? location = freezed,
    Object? rating = freezed,
    Object? estimatedValue = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? length = freezed,
    Object? weight = freezed,
    Object? reservedDates = null,
  }) {
    return _then(_$_ToolModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      maybeFree: freezed == maybeFree
          ? _value.maybeFree
          : maybeFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      transportOptions: freezed == transportOptions
          ? _value.transportOptions
          : transportOptions // ignore: cast_nullable_to_non_nullable
              as TransportOptions?,
      toolCategory: freezed == toolCategory
          ? _value.toolCategory
          : toolCategory // ignore: cast_nullable_to_non_nullable
              as ToolCategory?,
      askWithFee: freezed == askWithFee
          ? _value.askWithFee
          : askWithFee // ignore: cast_nullable_to_non_nullable
              as bool?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      reservedDates: null == reservedDates
          ? _value._reservedDates
          : reservedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTimeRange>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToolModel implements _ToolModel {
  const _$_ToolModel(
      {this.id,
      required this.title,
      required this.description,
      this.isAvailable = true,
      this.maybeFree,
      this.cost,
      this.userId,
      final List<String>? images,
      this.transportOptions,
      this.toolCategory,
      this.askWithFee,
      this.location,
      this.rating,
      this.estimatedValue,
      this.height,
      this.width,
      this.length,
      this.weight,
      @TimestampListOrNullConverter()
          final List<DateTimeRange> reservedDates = const []})
      : _images = images,
        _reservedDates = reservedDates;

  factory _$_ToolModel.fromJson(Map<String, dynamic> json) =>
      _$$_ToolModelFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey()
  final bool isAvailable;
  @override
  final bool? maybeFree;
  @override
  final int? cost;
  @override
  final int? userId;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TransportOptions? transportOptions;
  @override
  final ToolCategory? toolCategory;
  @override
  final bool? askWithFee;
  @override
  final LatLng? location;
  @override
  final double? rating;
  @override
  final double? estimatedValue;
  @override
  final double? height;
  @override
  final double? width;
  @override
  final double? length;
  @override
  final double? weight;
  final List<DateTimeRange> _reservedDates;
  @override
  @JsonKey()
  @TimestampListOrNullConverter()
  List<DateTimeRange> get reservedDates {
    if (_reservedDates is EqualUnmodifiableListView) return _reservedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservedDates);
  }

  @override
  String toString() {
    return 'ToolModel(id: $id, title: $title, description: $description, isAvailable: $isAvailable, maybeFree: $maybeFree, cost: $cost, userId: $userId, images: $images, transportOptions: $transportOptions, toolCategory: $toolCategory, askWithFee: $askWithFee, location: $location, rating: $rating, estimatedValue: $estimatedValue, height: $height, width: $width, length: $length, weight: $weight, reservedDates: $reservedDates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToolModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.maybeFree, maybeFree) ||
                other.maybeFree == maybeFree) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.transportOptions, transportOptions) ||
                other.transportOptions == transportOptions) &&
            (identical(other.toolCategory, toolCategory) ||
                other.toolCategory == toolCategory) &&
            (identical(other.askWithFee, askWithFee) ||
                other.askWithFee == askWithFee) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.estimatedValue, estimatedValue) ||
                other.estimatedValue == estimatedValue) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality()
                .equals(other._reservedDates, _reservedDates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        isAvailable,
        maybeFree,
        cost,
        userId,
        const DeepCollectionEquality().hash(_images),
        transportOptions,
        toolCategory,
        askWithFee,
        location,
        rating,
        estimatedValue,
        height,
        width,
        length,
        weight,
        const DeepCollectionEquality().hash(_reservedDates)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToolModelCopyWith<_$_ToolModel> get copyWith =>
      __$$_ToolModelCopyWithImpl<_$_ToolModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToolModelToJson(
      this,
    );
  }
}

abstract class _ToolModel implements ToolModel {
  const factory _ToolModel(
      {final int? id,
      required final String title,
      required final String description,
      final bool isAvailable,
      final bool? maybeFree,
      final int? cost,
      final int? userId,
      final List<String>? images,
      final TransportOptions? transportOptions,
      final ToolCategory? toolCategory,
      final bool? askWithFee,
      final LatLng? location,
      final double? rating,
      final double? estimatedValue,
      final double? height,
      final double? width,
      final double? length,
      final double? weight,
      @TimestampListOrNullConverter()
          final List<DateTimeRange> reservedDates}) = _$_ToolModel;

  factory _ToolModel.fromJson(Map<String, dynamic> json) =
      _$_ToolModel.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  bool get isAvailable;
  @override
  bool? get maybeFree;
  @override
  int? get cost;
  @override
  int? get userId;
  @override
  List<String>? get images;
  @override
  TransportOptions? get transportOptions;
  @override
  ToolCategory? get toolCategory;
  @override
  bool? get askWithFee;
  @override
  LatLng? get location;
  @override
  double? get rating;
  @override
  double? get estimatedValue;
  @override
  double? get height;
  @override
  double? get width;
  @override
  double? get length;
  @override
  double? get weight;
  @override
  @TimestampListOrNullConverter()
  List<DateTimeRange> get reservedDates;
  @override
  @JsonKey(ignore: true)
  _$$_ToolModelCopyWith<_$_ToolModel> get copyWith =>
      throw _privateConstructorUsedError;
}
