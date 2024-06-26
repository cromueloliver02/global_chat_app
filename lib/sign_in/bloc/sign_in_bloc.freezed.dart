// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError; // form
  AutovalidateMode get autovalidateMode => throw _privateConstructorUsedError;
  EmailInput get emailInput => throw _privateConstructorUsedError;
  PasswordInput get passwordInput => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      Failure? failure,
      AutovalidateMode autovalidateMode,
      EmailInput emailInput,
      PasswordInput passwordInput});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? autovalidateMode = null,
    Object? emailInput = null,
    Object? passwordInput = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      emailInput: null == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      passwordInput: null == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
          _$SignInStateImpl value, $Res Function(_$SignInStateImpl) then) =
      __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      Failure? failure,
      AutovalidateMode autovalidateMode,
      EmailInput emailInput,
      PasswordInput passwordInput});
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
      _$SignInStateImpl _value, $Res Function(_$SignInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? autovalidateMode = null,
    Object? emailInput = null,
    Object? passwordInput = null,
  }) {
    return _then(_$SignInStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      autovalidateMode: null == autovalidateMode
          ? _value.autovalidateMode
          : autovalidateMode // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      emailInput: null == emailInput
          ? _value.emailInput
          : emailInput // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      passwordInput: null == passwordInput
          ? _value.passwordInput
          : passwordInput // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
    ));
  }
}

/// @nodoc

class _$SignInStateImpl extends _SignInState {
  const _$SignInStateImpl(
      {this.status = FormzSubmissionStatus.initial,
      this.failure = null,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.emailInput = const EmailInput.pure(),
      this.passwordInput = const PasswordInput.pure()})
      : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final Failure? failure;
// form
  @override
  @JsonKey()
  final AutovalidateMode autovalidateMode;
  @override
  @JsonKey()
  final EmailInput emailInput;
  @override
  @JsonKey()
  final PasswordInput passwordInput;

  @override
  String toString() {
    return 'SignInState(status: $status, failure: $failure, autovalidateMode: $autovalidateMode, emailInput: $emailInput, passwordInput: $passwordInput)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.autovalidateMode, autovalidateMode) ||
                other.autovalidateMode == autovalidateMode) &&
            (identical(other.emailInput, emailInput) ||
                other.emailInput == emailInput) &&
            (identical(other.passwordInput, passwordInput) ||
                other.passwordInput == passwordInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure,
      autovalidateMode, emailInput, passwordInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState extends SignInState {
  const factory _SignInState(
      {final FormzSubmissionStatus status,
      final Failure? failure,
      final AutovalidateMode autovalidateMode,
      final EmailInput emailInput,
      final PasswordInput passwordInput}) = _$SignInStateImpl;
  const _SignInState._() : super._();

  @override
  FormzSubmissionStatus get status;
  @override
  Failure? get failure;
  @override // form
  AutovalidateMode get autovalidateMode;
  @override
  EmailInput get emailInput;
  @override
  PasswordInput get passwordInput;
  @override
  @JsonKey(ignore: true)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
