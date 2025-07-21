// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseMeta {
  int get code;
  String? get message;

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseMetaCopyWith<ResponseMeta> get copyWith =>
      _$ResponseMetaCopyWithImpl<ResponseMeta>(
          this as ResponseMeta, _$identity);

  /// Serializes this ResponseMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseMeta &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ResponseMeta(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $ResponseMetaCopyWith<$Res> {
  factory $ResponseMetaCopyWith(
          ResponseMeta value, $Res Function(ResponseMeta) _then) =
      _$ResponseMetaCopyWithImpl;
  @useResult
  $Res call({int code, String? message});
}

/// @nodoc
class _$ResponseMetaCopyWithImpl<$Res> implements $ResponseMetaCopyWith<$Res> {
  _$ResponseMetaCopyWithImpl(this._self, this._then);

  final ResponseMeta _self;
  final $Res Function(ResponseMeta) _then;

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResponseMeta].
extension ResponseMetaPatterns on ResponseMeta {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResponseMeta value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseMeta() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResponseMeta value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseMeta():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResponseMeta value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseMeta() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int code, String? message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseMeta() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int code, String? message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseMeta():
        return $default(_that.code, _that.message);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int code, String? message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseMeta() when $default != null:
        return $default(_that.code, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ResponseMeta implements ResponseMeta {
  const _ResponseMeta({required this.code, this.message});
  factory _ResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$ResponseMetaFromJson(json);

  @override
  final int code;
  @override
  final String? message;

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResponseMetaCopyWith<_ResponseMeta> get copyWith =>
      __$ResponseMetaCopyWithImpl<_ResponseMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseMeta &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @override
  String toString() {
    return 'ResponseMeta(code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ResponseMetaCopyWith<$Res>
    implements $ResponseMetaCopyWith<$Res> {
  factory _$ResponseMetaCopyWith(
          _ResponseMeta value, $Res Function(_ResponseMeta) _then) =
      __$ResponseMetaCopyWithImpl;
  @override
  @useResult
  $Res call({int code, String? message});
}

/// @nodoc
class __$ResponseMetaCopyWithImpl<$Res>
    implements _$ResponseMetaCopyWith<$Res> {
  __$ResponseMetaCopyWithImpl(this._self, this._then);

  final _ResponseMeta _self;
  final $Res Function(_ResponseMeta) _then;

  /// Create a copy of ResponseMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_ResponseMeta(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
