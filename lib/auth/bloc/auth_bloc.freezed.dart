// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  AuthStatus get status => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  AuthSubscribeStatus get subscribeStatus => throw _privateConstructorUsedError;
  AuthSignOutStatus get signOutStatus => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {AuthStatus status,
      User? user,
      AuthSubscribeStatus subscribeStatus,
      AuthSignOutStatus signOutStatus,
      Failure? failure});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? subscribeStatus = null,
    Object? signOutStatus = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      subscribeStatus: null == subscribeStatus
          ? _value.subscribeStatus
          : subscribeStatus // ignore: cast_nullable_to_non_nullable
              as AuthSubscribeStatus,
      signOutStatus: null == signOutStatus
          ? _value.signOutStatus
          : signOutStatus // ignore: cast_nullable_to_non_nullable
              as AuthSignOutStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus status,
      User? user,
      AuthSubscribeStatus subscribeStatus,
      AuthSignOutStatus signOutStatus,
      Failure? failure});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? subscribeStatus = null,
    Object? signOutStatus = null,
    Object? failure = freezed,
  }) {
    return _then(_$AuthStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      subscribeStatus: null == subscribeStatus
          ? _value.subscribeStatus
          : subscribeStatus // ignore: cast_nullable_to_non_nullable
              as AuthSubscribeStatus,
      signOutStatus: null == signOutStatus
          ? _value.signOutStatus
          : signOutStatus // ignore: cast_nullable_to_non_nullable
              as AuthSignOutStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState with DiagnosticableTreeMixin {
  const _$AuthStateImpl(
      {this.status = AuthStatus.unknown,
      this.user = null,
      this.subscribeStatus = AuthSubscribeStatus.initial,
      this.signOutStatus = AuthSignOutStatus.initial,
      this.failure = null})
      : super._();

  @override
  @JsonKey()
  final AuthStatus status;
  @override
  @JsonKey()
  final User? user;
  @override
  @JsonKey()
  final AuthSubscribeStatus subscribeStatus;
  @override
  @JsonKey()
  final AuthSignOutStatus signOutStatus;
  @override
  @JsonKey()
  final Failure? failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(status: $status, user: $user, subscribeStatus: $subscribeStatus, signOutStatus: $signOutStatus, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('subscribeStatus', subscribeStatus))
      ..add(DiagnosticsProperty('signOutStatus', signOutStatus))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.subscribeStatus, subscribeStatus) ||
                other.subscribeStatus == subscribeStatus) &&
            (identical(other.signOutStatus, signOutStatus) ||
                other.signOutStatus == signOutStatus) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, user, subscribeStatus, signOutStatus, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {final AuthStatus status,
      final User? user,
      final AuthSubscribeStatus subscribeStatus,
      final AuthSignOutStatus signOutStatus,
      final Failure? failure}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  AuthStatus get status;
  @override
  User? get user;
  @override
  AuthSubscribeStatus get subscribeStatus;
  @override
  AuthSignOutStatus get signOutStatus;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
