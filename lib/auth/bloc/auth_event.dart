part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class AuthStatusChangesSubscribed extends AuthEvent {
  const AuthStatusChangesSubscribed();
}

final class AuthSignedOut extends AuthEvent {
  const AuthSignedOut();
}
