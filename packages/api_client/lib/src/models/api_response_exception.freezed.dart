// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponseException {
  ResponseMeta get response;
  Map<String, dynamic>? get data;

  /// Create a copy of ApiResponseException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiResponseExceptionCopyWith<ApiResponseException> get copyWith =>
      _$ApiResponseExceptionCopyWithImpl<ApiResponseException>(
          this as ApiResponseException, _$identity);

  /// Serializes this ApiResponseException to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiResponseException &&
            (identical(other.response, response) ||
                other.response == response) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, response, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ApiResponseException(response: $response, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ApiResponseExceptionCopyWith<$Res> {
  factory $ApiResponseExceptionCopyWith(ApiResponseException value,
          $Res Function(ApiResponseException) _then) =
      _$ApiResponseExceptionCopyWithImpl;
  @useResult
  $Res call({ResponseMeta response, Map<String, dynamic>? data});

  $ResponseMetaCopyWith<$Res> get response;
}

/// @nodoc
class _$ApiResponseExceptionCopyWithImpl<$Res>
    implements $ApiResponseExceptionCopyWith<$Res> {
  _$ApiResponseExceptionCopyWithImpl(this._self, this._then);

  final ApiResponseException _self;
  final $Res Function(ApiResponseException) _then;

  /// Create a copy of ApiResponseException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseMeta,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of ApiResponseException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseMetaCopyWith<$Res> get response {
    return $ResponseMetaCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ApiResponseException].
extension ApiResponseExceptionPatterns on ApiResponseException {
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
    TResult Function(_ApiResponseException value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiResponseException() when $default != null:
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
    TResult Function(_ApiResponseException value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiResponseException():
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
    TResult? Function(_ApiResponseException value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiResponseException() when $default != null:
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
    TResult Function(ResponseMeta response, Map<String, dynamic>? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiResponseException() when $default != null:
        return $default(_that.response, _that.data);
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
    TResult Function(ResponseMeta response, Map<String, dynamic>? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiResponseException():
        return $default(_that.response, _that.data);
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
    TResult? Function(ResponseMeta response, Map<String, dynamic>? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiResponseException() when $default != null:
        return $default(_that.response, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ApiResponseException implements ApiResponseException {
  const _ApiResponseException(
      {required this.response, required final Map<String, dynamic>? data})
      : _data = data;
  factory _ApiResponseException.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseExceptionFromJson(json);

  @override
  final ResponseMeta response;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of ApiResponseException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApiResponseExceptionCopyWith<_ApiResponseException> get copyWith =>
      __$ApiResponseExceptionCopyWithImpl<_ApiResponseException>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ApiResponseExceptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiResponseException &&
            (identical(other.response, response) ||
                other.response == response) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, response, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ApiResponseException(response: $response, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ApiResponseExceptionCopyWith<$Res>
    implements $ApiResponseExceptionCopyWith<$Res> {
  factory _$ApiResponseExceptionCopyWith(_ApiResponseException value,
          $Res Function(_ApiResponseException) _then) =
      __$ApiResponseExceptionCopyWithImpl;
  @override
  @useResult
  $Res call({ResponseMeta response, Map<String, dynamic>? data});

  @override
  $ResponseMetaCopyWith<$Res> get response;
}

/// @nodoc
class __$ApiResponseExceptionCopyWithImpl<$Res>
    implements _$ApiResponseExceptionCopyWith<$Res> {
  __$ApiResponseExceptionCopyWithImpl(this._self, this._then);

  final _ApiResponseException _self;
  final $Res Function(_ApiResponseException) _then;

  /// Create a copy of ApiResponseException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
    Object? data = freezed,
  }) {
    return _then(_ApiResponseException(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as ResponseMeta,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of ApiResponseException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseMetaCopyWith<$Res> get response {
    return $ResponseMetaCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

// dart format on
