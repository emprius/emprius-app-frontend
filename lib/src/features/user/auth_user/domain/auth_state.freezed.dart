// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String fullName) authenticated,
    required TResult Function(String reason) failed,
    required TResult Function() unset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FAILED value) failed,
    required TResult Function(UNSET value) unset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$UNAUTHENTICATEDCopyWith<$Res> {
  factory _$$UNAUTHENTICATEDCopyWith(
          _$UNAUTHENTICATED value, $Res Function(_$UNAUTHENTICATED) then) =
      __$$UNAUTHENTICATEDCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UNAUTHENTICATEDCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$UNAUTHENTICATEDCopyWith<$Res> {
  __$$UNAUTHENTICATEDCopyWithImpl(
      _$UNAUTHENTICATED _value, $Res Function(_$UNAUTHENTICATED) _then)
      : super(_value, (v) => _then(v as _$UNAUTHENTICATED));

  @override
  _$UNAUTHENTICATED get _value => super._value as _$UNAUTHENTICATED;
}

/// @nodoc

class _$UNAUTHENTICATED implements UNAUTHENTICATED {
  const _$UNAUTHENTICATED();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UNAUTHENTICATED);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String fullName) authenticated,
    required TResult Function(String reason) failed,
    required TResult Function() unset,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FAILED value) failed,
    required TResult Function(UNSET value) unset,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class UNAUTHENTICATED implements AuthState {
  const factory UNAUTHENTICATED() = _$UNAUTHENTICATED;
}

/// @nodoc
abstract class _$$AUTHENTICATINGCopyWith<$Res> {
  factory _$$AUTHENTICATINGCopyWith(
          _$AUTHENTICATING value, $Res Function(_$AUTHENTICATING) then) =
      __$$AUTHENTICATINGCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AUTHENTICATINGCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AUTHENTICATINGCopyWith<$Res> {
  __$$AUTHENTICATINGCopyWithImpl(
      _$AUTHENTICATING _value, $Res Function(_$AUTHENTICATING) _then)
      : super(_value, (v) => _then(v as _$AUTHENTICATING));

  @override
  _$AUTHENTICATING get _value => super._value as _$AUTHENTICATING;
}

/// @nodoc

class _$AUTHENTICATING implements AUTHENTICATING {
  const _$AUTHENTICATING();

  @override
  String toString() {
    return 'AuthState.authenticating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AUTHENTICATING);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String fullName) authenticated,
    required TResult Function(String reason) failed,
    required TResult Function() unset,
  }) {
    return authenticating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
  }) {
    return authenticating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FAILED value) failed,
    required TResult Function(UNSET value) unset,
  }) {
    return authenticating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
  }) {
    return authenticating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
    required TResult orElse(),
  }) {
    if (authenticating != null) {
      return authenticating(this);
    }
    return orElse();
  }
}

abstract class AUTHENTICATING implements AuthState {
  const factory AUTHENTICATING() = _$AUTHENTICATING;
}

/// @nodoc
abstract class _$$AUTHENTICATEDCopyWith<$Res> {
  factory _$$AUTHENTICATEDCopyWith(
          _$AUTHENTICATED value, $Res Function(_$AUTHENTICATED) then) =
      __$$AUTHENTICATEDCopyWithImpl<$Res>;
  $Res call({String fullName});
}

/// @nodoc
class __$$AUTHENTICATEDCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$AUTHENTICATEDCopyWith<$Res> {
  __$$AUTHENTICATEDCopyWithImpl(
      _$AUTHENTICATED _value, $Res Function(_$AUTHENTICATED) _then)
      : super(_value, (v) => _then(v as _$AUTHENTICATED));

  @override
  _$AUTHENTICATED get _value => super._value as _$AUTHENTICATED;

  @override
  $Res call({
    Object? fullName = freezed,
  }) {
    return _then(_$AUTHENTICATED(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AUTHENTICATED implements AUTHENTICATED {
  const _$AUTHENTICATED({required this.fullName});

  @override
  final String fullName;

  @override
  String toString() {
    return 'AuthState.authenticated(fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AUTHENTICATED &&
            const DeepCollectionEquality().equals(other.fullName, fullName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(fullName));

  @JsonKey(ignore: true)
  @override
  _$$AUTHENTICATEDCopyWith<_$AUTHENTICATED> get copyWith =>
      __$$AUTHENTICATEDCopyWithImpl<_$AUTHENTICATED>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String fullName) authenticated,
    required TResult Function(String reason) failed,
    required TResult Function() unset,
  }) {
    return authenticated(fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
  }) {
    return authenticated?.call(fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FAILED value) failed,
    required TResult Function(UNSET value) unset,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AUTHENTICATED implements AuthState {
  const factory AUTHENTICATED({required final String fullName}) =
      _$AUTHENTICATED;

  String get fullName;
  @JsonKey(ignore: true)
  _$$AUTHENTICATEDCopyWith<_$AUTHENTICATED> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FAILEDCopyWith<$Res> {
  factory _$$FAILEDCopyWith(_$FAILED value, $Res Function(_$FAILED) then) =
      __$$FAILEDCopyWithImpl<$Res>;
  $Res call({String reason});
}

/// @nodoc
class __$$FAILEDCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$FAILEDCopyWith<$Res> {
  __$$FAILEDCopyWithImpl(_$FAILED _value, $Res Function(_$FAILED) _then)
      : super(_value, (v) => _then(v as _$FAILED));

  @override
  _$FAILED get _value => super._value as _$FAILED;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_$FAILED(
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FAILED implements FAILED {
  const _$FAILED({required this.reason});

  @override
  final String reason;

  @override
  String toString() {
    return 'AuthState.failed(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAILED &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  _$$FAILEDCopyWith<_$FAILED> get copyWith =>
      __$$FAILEDCopyWithImpl<_$FAILED>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String fullName) authenticated,
    required TResult Function(String reason) failed,
    required TResult Function() unset,
  }) {
    return failed(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
  }) {
    return failed?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FAILED value) failed,
    required TResult Function(UNSET value) unset,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FAILED implements AuthState {
  const factory FAILED({required final String reason}) = _$FAILED;

  String get reason;
  @JsonKey(ignore: true)
  _$$FAILEDCopyWith<_$FAILED> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UNSETCopyWith<$Res> {
  factory _$$UNSETCopyWith(_$UNSET value, $Res Function(_$UNSET) then) =
      __$$UNSETCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UNSETCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$UNSETCopyWith<$Res> {
  __$$UNSETCopyWithImpl(_$UNSET _value, $Res Function(_$UNSET) _then)
      : super(_value, (v) => _then(v as _$UNSET));

  @override
  _$UNSET get _value => super._value as _$UNSET;
}

/// @nodoc

class _$UNSET implements UNSET {
  const _$UNSET();

  @override
  String toString() {
    return 'AuthState.unset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UNSET);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function(String fullName) authenticated,
    required TResult Function(String reason) failed,
    required TResult Function() unset,
  }) {
    return unset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
  }) {
    return unset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function(String fullName)? authenticated,
    TResult Function(String reason)? failed,
    TResult Function()? unset,
    required TResult orElse(),
  }) {
    if (unset != null) {
      return unset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UNAUTHENTICATED value) unauthenticated,
    required TResult Function(AUTHENTICATING value) authenticating,
    required TResult Function(AUTHENTICATED value) authenticated,
    required TResult Function(FAILED value) failed,
    required TResult Function(UNSET value) unset,
  }) {
    return unset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
  }) {
    return unset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UNAUTHENTICATED value)? unauthenticated,
    TResult Function(AUTHENTICATING value)? authenticating,
    TResult Function(AUTHENTICATED value)? authenticated,
    TResult Function(FAILED value)? failed,
    TResult Function(UNSET value)? unset,
    required TResult orElse(),
  }) {
    if (unset != null) {
      return unset(this);
    }
    return orElse();
  }
}

abstract class UNSET implements AuthState {
  const factory UNSET() = _$UNSET;
}
