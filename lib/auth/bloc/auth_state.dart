part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

enum AuthSubscribeStatus { initial, inProgress, success, failure }

enum AuthSignOutStatus { initial, inProgress, success, failure }

extension AuthStatusX on AuthStatus {
  bool get isUnknown => this == AuthStatus.unknown;
  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isAnauthenticated => this == AuthStatus.unauthenticated;
}

extension SubscribeStatusX on AuthSubscribeStatus {
  bool get isInitial => this == AuthSubscribeStatus.initial;
  bool get isInProgress => this == AuthSubscribeStatus.inProgress;
  bool get isSuccess => this == AuthSubscribeStatus.success;
  bool get isFailure => this == AuthSubscribeStatus.failure;
}

extension SignOutStatusX on AuthSignOutStatus {
  bool get isInitial => this == AuthSignOutStatus.initial;
  bool get isInProgress => this == AuthSignOutStatus.inProgress;
  bool get isSuccess => this == AuthSignOutStatus.success;
  bool get isFailure => this == AuthSignOutStatus.failure;
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(AuthStatus.unknown) AuthStatus status,
    @Default(null) User? user,
    @Default(AuthSubscribeStatus.initial) AuthSubscribeStatus subscribeStatus,
    @Default(AuthSignOutStatus.initial) AuthSignOutStatus signOutStatus,
    @Default(null) Failure? failure,
  }) = _AuthState;

  factory AuthState.unknown() => const AuthState();

  factory AuthState.authenticated(User user) => AuthState(
        status: AuthStatus.authenticated,
        user: user,
        subscribeStatus: AuthSubscribeStatus.success,
      );

  factory AuthState.unauthenticated([Failure? failure]) {
    return AuthState(
      status: AuthStatus.unauthenticated,
      subscribeStatus: failure == null
          ? AuthSubscribeStatus.success
          : AuthSubscribeStatus.failure,
      failure: failure,
    );
  }
}
