// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emprius_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmpriusImageModel _$EmpriusImageModelFromJson(Map<String, dynamic> json) {
  return _EmpriusImageModel.fromJson(json);
}

/// @nodoc
mixin _$EmpriusImageModel {
  String get hash => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmpriusImageModelCopyWith<EmpriusImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmpriusImageModelCopyWith<$Res> {
  factory $EmpriusImageModelCopyWith(
          EmpriusImageModel value, $Res Function(EmpriusImageModel) then) =
      _$EmpriusImageModelCopyWithImpl<$Res, EmpriusImageModel>;
  @useResult
  $Res call({String hash, String name, String content, String link});
}

/// @nodoc
class _$EmpriusImageModelCopyWithImpl<$Res, $Val extends EmpriusImageModel>
    implements $EmpriusImageModelCopyWith<$Res> {
  _$EmpriusImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? name = null,
    Object? content = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmpriusImageModelCopyWith<$Res>
    implements $EmpriusImageModelCopyWith<$Res> {
  factory _$$_EmpriusImageModelCopyWith(_$_EmpriusImageModel value,
          $Res Function(_$_EmpriusImageModel) then) =
      __$$_EmpriusImageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hash, String name, String content, String link});
}

/// @nodoc
class __$$_EmpriusImageModelCopyWithImpl<$Res>
    extends _$EmpriusImageModelCopyWithImpl<$Res, _$_EmpriusImageModel>
    implements _$$_EmpriusImageModelCopyWith<$Res> {
  __$$_EmpriusImageModelCopyWithImpl(
      _$_EmpriusImageModel _value, $Res Function(_$_EmpriusImageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? name = null,
    Object? content = null,
    Object? link = null,
  }) {
    return _then(_$_EmpriusImageModel(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmpriusImageModel implements _EmpriusImageModel {
  const _$_EmpriusImageModel(
      {required this.hash,
      required this.name,
      required this.content,
      required this.link});

  factory _$_EmpriusImageModel.fromJson(Map<String, dynamic> json) =>
      _$$_EmpriusImageModelFromJson(json);

  @override
  final String hash;
  @override
  final String name;
  @override
  final String content;
  @override
  final String link;

  @override
  String toString() {
    return 'EmpriusImageModel(hash: $hash, name: $name, content: $content, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmpriusImageModel &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hash, name, content, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmpriusImageModelCopyWith<_$_EmpriusImageModel> get copyWith =>
      __$$_EmpriusImageModelCopyWithImpl<_$_EmpriusImageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmpriusImageModelToJson(
      this,
    );
  }
}

abstract class _EmpriusImageModel implements EmpriusImageModel {
  const factory _EmpriusImageModel(
      {required final String hash,
      required final String name,
      required final String content,
      required final String link}) = _$_EmpriusImageModel;

  factory _EmpriusImageModel.fromJson(Map<String, dynamic> json) =
      _$_EmpriusImageModel.fromJson;

  @override
  String get hash;
  @override
  String get name;
  @override
  String get content;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$$_EmpriusImageModelCopyWith<_$_EmpriusImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
