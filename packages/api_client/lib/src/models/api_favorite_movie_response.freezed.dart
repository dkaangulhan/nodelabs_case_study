// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_favorite_movie_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiFavoriteMovieResponse {
  Movie get movie;
  ToggleFavoriteAction get action;

  /// Create a copy of ApiFavoriteMovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiFavoriteMovieResponseCopyWith<ApiFavoriteMovieResponse> get copyWith =>
      _$ApiFavoriteMovieResponseCopyWithImpl<ApiFavoriteMovieResponse>(
          this as ApiFavoriteMovieResponse, _$identity);

  /// Serializes this ApiFavoriteMovieResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiFavoriteMovieResponse &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, movie, action);

  @override
  String toString() {
    return 'ApiFavoriteMovieResponse(movie: $movie, action: $action)';
  }
}

/// @nodoc
abstract mixin class $ApiFavoriteMovieResponseCopyWith<$Res> {
  factory $ApiFavoriteMovieResponseCopyWith(ApiFavoriteMovieResponse value,
          $Res Function(ApiFavoriteMovieResponse) _then) =
      _$ApiFavoriteMovieResponseCopyWithImpl;
  @useResult
  $Res call({Movie movie, ToggleFavoriteAction action});

  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class _$ApiFavoriteMovieResponseCopyWithImpl<$Res>
    implements $ApiFavoriteMovieResponseCopyWith<$Res> {
  _$ApiFavoriteMovieResponseCopyWithImpl(this._self, this._then);

  final ApiFavoriteMovieResponse _self;
  final $Res Function(ApiFavoriteMovieResponse) _then;

  /// Create a copy of ApiFavoriteMovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
    Object? action = null,
  }) {
    return _then(_self.copyWith(
      movie: null == movie
          ? _self.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as ToggleFavoriteAction,
    ));
  }

  /// Create a copy of ApiFavoriteMovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_self.movie, (value) {
      return _then(_self.copyWith(movie: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ApiFavoriteMovieResponse].
extension ApiFavoriteMovieResponsePatterns on ApiFavoriteMovieResponse {
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
    TResult Function(_ApiFavoriteMovieResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiFavoriteMovieResponse() when $default != null:
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
    TResult Function(_ApiFavoriteMovieResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiFavoriteMovieResponse():
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
    TResult? Function(_ApiFavoriteMovieResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiFavoriteMovieResponse() when $default != null:
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
    TResult Function(Movie movie, ToggleFavoriteAction action)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ApiFavoriteMovieResponse() when $default != null:
        return $default(_that.movie, _that.action);
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
    TResult Function(Movie movie, ToggleFavoriteAction action) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiFavoriteMovieResponse():
        return $default(_that.movie, _that.action);
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
    TResult? Function(Movie movie, ToggleFavoriteAction action)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ApiFavoriteMovieResponse() when $default != null:
        return $default(_that.movie, _that.action);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ApiFavoriteMovieResponse implements ApiFavoriteMovieResponse {
  const _ApiFavoriteMovieResponse({required this.movie, required this.action});
  factory _ApiFavoriteMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiFavoriteMovieResponseFromJson(json);

  @override
  final Movie movie;
  @override
  final ToggleFavoriteAction action;

  /// Create a copy of ApiFavoriteMovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ApiFavoriteMovieResponseCopyWith<_ApiFavoriteMovieResponse> get copyWith =>
      __$ApiFavoriteMovieResponseCopyWithImpl<_ApiFavoriteMovieResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ApiFavoriteMovieResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiFavoriteMovieResponse &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, movie, action);

  @override
  String toString() {
    return 'ApiFavoriteMovieResponse(movie: $movie, action: $action)';
  }
}

/// @nodoc
abstract mixin class _$ApiFavoriteMovieResponseCopyWith<$Res>
    implements $ApiFavoriteMovieResponseCopyWith<$Res> {
  factory _$ApiFavoriteMovieResponseCopyWith(_ApiFavoriteMovieResponse value,
          $Res Function(_ApiFavoriteMovieResponse) _then) =
      __$ApiFavoriteMovieResponseCopyWithImpl;
  @override
  @useResult
  $Res call({Movie movie, ToggleFavoriteAction action});

  @override
  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$ApiFavoriteMovieResponseCopyWithImpl<$Res>
    implements _$ApiFavoriteMovieResponseCopyWith<$Res> {
  __$ApiFavoriteMovieResponseCopyWithImpl(this._self, this._then);

  final _ApiFavoriteMovieResponse _self;
  final $Res Function(_ApiFavoriteMovieResponse) _then;

  /// Create a copy of ApiFavoriteMovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movie = null,
    Object? action = null,
  }) {
    return _then(_ApiFavoriteMovieResponse(
      movie: null == movie
          ? _self.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as ToggleFavoriteAction,
    ));
  }

  /// Create a copy of ApiFavoriteMovieResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_self.movie, (value) {
      return _then(_self.copyWith(movie: value));
    });
  }
}

// dart format on
