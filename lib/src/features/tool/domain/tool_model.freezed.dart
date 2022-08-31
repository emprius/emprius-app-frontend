// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  List<String>? get images => throw _privateConstructorUsedError;
  TransportOptions? get transportOptions => throw _privateConstructorUsedError;
  ToolCategory? get toolCategory => throw _privateConstructorUsedError;
  bool? get askWithFee =>
      throw _privateConstructorUsedError; //TODO falta implementar:
  LatLng? get location => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  double? get estimatedValue => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get width => throw _privateConstructorUsedError;
  double? get length => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolModelCopyWith<ToolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolModelCopyWith<$Res> {
  factory $ToolModelCopyWith(ToolModel value, $Res Function(ToolModel) then) =
      _$ToolModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String title,
      String description,
      bool isAvailable,
      bool? maybeFree,
      int? cost,
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
      double? weight});
}

/// @nodoc
class _$ToolModelCopyWithImpl<$Res> implements $ToolModelCopyWith<$Res> {
  _$ToolModelCopyWithImpl(this._value, this._then);

  final ToolModel _value;
  // ignore: unused_field
  final $Res Function(ToolModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isAvailable = freezed,
    Object? maybeFree = freezed,
    Object? cost = freezed,
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
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      maybeFree: maybeFree == freezed
          ? _value.maybeFree
          : maybeFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      transportOptions: transportOptions == freezed
          ? _value.transportOptions
          : transportOptions // ignore: cast_nullable_to_non_nullable
              as TransportOptions?,
      toolCategory: toolCategory == freezed
          ? _value.toolCategory
          : toolCategory // ignore: cast_nullable_to_non_nullable
              as ToolCategory?,
      askWithFee: askWithFee == freezed
          ? _value.askWithFee
          : askWithFee // ignore: cast_nullable_to_non_nullable
              as bool?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      estimatedValue: estimatedValue == freezed
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_ToolModelCopyWith<$Res> implements $ToolModelCopyWith<$Res> {
  factory _$$_ToolModelCopyWith(
          _$_ToolModel value, $Res Function(_$_ToolModel) then) =
      __$$_ToolModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String title,
      String description,
      bool isAvailable,
      bool? maybeFree,
      int? cost,
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
      double? weight});
}

/// @nodoc
class __$$_ToolModelCopyWithImpl<$Res> extends _$ToolModelCopyWithImpl<$Res>
    implements _$$_ToolModelCopyWith<$Res> {
  __$$_ToolModelCopyWithImpl(
      _$_ToolModel _value, $Res Function(_$_ToolModel) _then)
      : super(_value, (v) => _then(v as _$_ToolModel));

  @override
  _$_ToolModel get _value => super._value as _$_ToolModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isAvailable = freezed,
    Object? maybeFree = freezed,
    Object? cost = freezed,
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
  }) {
    return _then(_$_ToolModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      maybeFree: maybeFree == freezed
          ? _value.maybeFree
          : maybeFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      transportOptions: transportOptions == freezed
          ? _value.transportOptions
          : transportOptions // ignore: cast_nullable_to_non_nullable
              as TransportOptions?,
      toolCategory: toolCategory == freezed
          ? _value.toolCategory
          : toolCategory // ignore: cast_nullable_to_non_nullable
              as ToolCategory?,
      askWithFee: askWithFee == freezed
          ? _value.askWithFee
          : askWithFee // ignore: cast_nullable_to_non_nullable
              as bool?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      estimatedValue: estimatedValue == freezed
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as double?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
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
      this.weight})
      : _images = images;

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
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final TransportOptions? transportOptions;
  @override
  final ToolCategory? toolCategory;
  @override
  final bool? askWithFee;
//TODO falta implementar:
  @override
  final LatLng? location;
  @override
  final int? rating;
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

  @override
  String toString() {
    return 'ToolModel(id: $id, title: $title, description: $description, isAvailable: $isAvailable, maybeFree: $maybeFree, cost: $cost, images: $images, transportOptions: $transportOptions, toolCategory: $toolCategory, askWithFee: $askWithFee, location: $location, rating: $rating, estimatedValue: $estimatedValue, height: $height, width: $width, length: $length, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToolModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            const DeepCollectionEquality().equals(other.maybeFree, maybeFree) &&
            const DeepCollectionEquality().equals(other.cost, cost) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other.transportOptions, transportOptions) &&
            const DeepCollectionEquality()
                .equals(other.toolCategory, toolCategory) &&
            const DeepCollectionEquality()
                .equals(other.askWithFee, askWithFee) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality()
                .equals(other.estimatedValue, estimatedValue) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isAvailable),
      const DeepCollectionEquality().hash(maybeFree),
      const DeepCollectionEquality().hash(cost),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(transportOptions),
      const DeepCollectionEquality().hash(toolCategory),
      const DeepCollectionEquality().hash(askWithFee),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(estimatedValue),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
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
      final List<String>? images,
      final TransportOptions? transportOptions,
      final ToolCategory? toolCategory,
      final bool? askWithFee,
      final LatLng? location,
      final int? rating,
      final double? estimatedValue,
      final double? height,
      final double? width,
      final double? length,
      final double? weight}) = _$_ToolModel;

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
  List<String>? get images;
  @override
  TransportOptions? get transportOptions;
  @override
  ToolCategory? get toolCategory;
  @override
  bool? get askWithFee;
  @override //TODO falta implementar:
  LatLng? get location;
  @override
  int? get rating;
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
  @JsonKey(ignore: true)
  _$$_ToolModelCopyWith<_$_ToolModel> get copyWith =>
      throw _privateConstructorUsedError;
}
