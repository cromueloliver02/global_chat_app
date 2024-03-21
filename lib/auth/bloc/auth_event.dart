part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class AuthStateChangesSubscribed extends AuthEvent {
  const AuthStateChangesSubscribed();
}

final class AuthSignedOut extends AuthEvent {
  const AuthSignedOut();
}
