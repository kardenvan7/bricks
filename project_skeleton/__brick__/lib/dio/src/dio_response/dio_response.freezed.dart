// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DioResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioFailure failure) failed,
    required TResult Function(Response<dynamic> response) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioFailure failure)? failed,
    TResult? Function(Response<dynamic> response)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioFailure failure)? failed,
    TResult Function(Response<dynamic> response)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$FailedDioResponse value) failed,
    required TResult Function(_$SuccessfulDioResponse value) successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$FailedDioResponse value)? failed,
    TResult? Function(_$SuccessfulDioResponse value)? successful,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$FailedDioResponse value)? failed,
    TResult Function(_$SuccessfulDioResponse value)? successful,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DioResponseCopyWith<$Res> {
  factory $DioResponseCopyWith(
          DioResponse value, $Res Function(DioResponse) then) =
      _$DioResponseCopyWithImpl<$Res, DioResponse>;
}

/// @nodoc
class _$DioResponseCopyWithImpl<$Res, $Val extends DioResponse>
    implements $DioResponseCopyWith<$Res> {
  _$DioResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_$FailedDioResponseCopyWith<$Res> {
  factory _$$_$FailedDioResponseCopyWith(_$_$FailedDioResponse value,
          $Res Function(_$_$FailedDioResponse) then) =
      __$$_$FailedDioResponseCopyWithImpl<$Res>;
  @useResult
  $Res call({DioFailure failure});

  $DioFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_$FailedDioResponseCopyWithImpl<$Res>
    extends _$DioResponseCopyWithImpl<$Res, _$_$FailedDioResponse>
    implements _$$_$FailedDioResponseCopyWith<$Res> {
  __$$_$FailedDioResponseCopyWithImpl(
      _$_$FailedDioResponse _value, $Res Function(_$_$FailedDioResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_$FailedDioResponse(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as DioFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DioFailureCopyWith<$Res> get failure {
    return $DioFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_$FailedDioResponse extends _$FailedDioResponse {
  _$_$FailedDioResponse(this.failure) : super._();

  @override
  final DioFailure failure;

  @override
  String toString() {
    return 'DioResponse.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$FailedDioResponse &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_$FailedDioResponseCopyWith<_$_$FailedDioResponse> get copyWith =>
      __$$_$FailedDioResponseCopyWithImpl<_$_$FailedDioResponse>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioFailure failure) failed,
    required TResult Function(Response<dynamic> response) successful,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioFailure failure)? failed,
    TResult? Function(Response<dynamic> response)? successful,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioFailure failure)? failed,
    TResult Function(Response<dynamic> response)? successful,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$FailedDioResponse value) failed,
    required TResult Function(_$SuccessfulDioResponse value) successful,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$FailedDioResponse value)? failed,
    TResult? Function(_$SuccessfulDioResponse value)? successful,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$FailedDioResponse value)? failed,
    TResult Function(_$SuccessfulDioResponse value)? successful,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _$FailedDioResponse extends DioResponse {
  factory _$FailedDioResponse(final DioFailure failure) = _$_$FailedDioResponse;
  _$FailedDioResponse._() : super._();

  DioFailure get failure;
  @JsonKey(ignore: true)
  _$$_$FailedDioResponseCopyWith<_$_$FailedDioResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_$SuccessfulDioResponseCopyWith<$Res> {
  factory _$$_$SuccessfulDioResponseCopyWith(_$_$SuccessfulDioResponse value,
          $Res Function(_$_$SuccessfulDioResponse) then) =
      __$$_$SuccessfulDioResponseCopyWithImpl<$Res>;
  @useResult
  $Res call({Response<dynamic> response});
}

/// @nodoc
class __$$_$SuccessfulDioResponseCopyWithImpl<$Res>
    extends _$DioResponseCopyWithImpl<$Res, _$_$SuccessfulDioResponse>
    implements _$$_$SuccessfulDioResponseCopyWith<$Res> {
  __$$_$SuccessfulDioResponseCopyWithImpl(_$_$SuccessfulDioResponse _value,
      $Res Function(_$_$SuccessfulDioResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$_$SuccessfulDioResponse(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Response<dynamic>,
    ));
  }
}

/// @nodoc

class _$_$SuccessfulDioResponse extends _$SuccessfulDioResponse {
  _$_$SuccessfulDioResponse(this.response) : super._();

  @override
  final Response<dynamic> response;

  @override
  String toString() {
    return 'DioResponse.successful(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$SuccessfulDioResponse &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_$SuccessfulDioResponseCopyWith<_$_$SuccessfulDioResponse> get copyWith =>
      __$$_$SuccessfulDioResponseCopyWithImpl<_$_$SuccessfulDioResponse>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DioFailure failure) failed,
    required TResult Function(Response<dynamic> response) successful,
  }) {
    return successful(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DioFailure failure)? failed,
    TResult? Function(Response<dynamic> response)? successful,
  }) {
    return successful?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DioFailure failure)? failed,
    TResult Function(Response<dynamic> response)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$FailedDioResponse value) failed,
    required TResult Function(_$SuccessfulDioResponse value) successful,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_$FailedDioResponse value)? failed,
    TResult? Function(_$SuccessfulDioResponse value)? successful,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$FailedDioResponse value)? failed,
    TResult Function(_$SuccessfulDioResponse value)? successful,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class _$SuccessfulDioResponse extends DioResponse {
  factory _$SuccessfulDioResponse(final Response<dynamic> response) =
      _$_$SuccessfulDioResponse;
  _$SuccessfulDioResponse._() : super._();

  Response<dynamic> get response;
  @JsonKey(ignore: true)
  _$$_$SuccessfulDioResponseCopyWith<_$_$SuccessfulDioResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
