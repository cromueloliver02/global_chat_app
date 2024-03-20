// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plm_error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PLMError {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PLMErrorCopyWith<PLMError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PLMErrorCopyWith<$Res> {
  factory $PLMErrorCopyWith(PLMError value, $Res Function(PLMError) then) =
      _$PLMErrorCopyWithImpl<$Res, PLMError>;
  @useResult
  $Res call({String title, String message, Failure failure});
}

/// @nodoc
class _$PLMErrorCopyWithImpl<$Res, $Val extends PLMError>
    implements $PLMErrorCopyWith<$Res> {
  _$PLMErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PLMErrorImplCopyWith<$Res>
    implements $PLMErrorCopyWith<$Res> {
  factory _$$PLMErrorImplCopyWith(
          _$PLMErrorImpl value, $Res Function(_$PLMErrorImpl) then) =
      __$$PLMErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message, Failure failure});
}

/// @nodoc
class __$$PLMErrorImplCopyWithImpl<$Res>
    extends _$PLMErrorCopyWithImpl<$Res, _$PLMErrorImpl>
    implements _$$PLMErrorImplCopyWith<$Res> {
  __$$PLMErrorImplCopyWithImpl(
      _$PLMErrorImpl _value, $Res Function(_$PLMErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? failure = null,
  }) {
    return _then(_$PLMErrorImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$PLMErrorImpl with DiagnosticableTreeMixin implements _PLMError {
  _$PLMErrorImpl(
      {required this.title, required this.message, required this.failure});

  @override
  final String title;
  @override
  final String message;
  @override
  final Failure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PLMError(title: $title, message: $message, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PLMError'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PLMErrorImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PLMErrorImplCopyWith<_$PLMErrorImpl> get copyWith =>
      __$$PLMErrorImplCopyWithImpl<_$PLMErrorImpl>(this, _$identity);
}

abstract class _PLMError implements PLMError {
  factory _PLMError(
      {required final String title,
      required final String message,
      required final Failure failure}) = _$PLMErrorImpl;

  @override
  String get title;
  @override
  String get message;
  @override
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$PLMErrorImplCopyWith<_$PLMErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
