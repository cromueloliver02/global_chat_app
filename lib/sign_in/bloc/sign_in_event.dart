part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

final class SignInSubmitted extends SignInEvent {
  const SignInSubmitted();
}

final class SignInEmailChanged extends SignInEvent {
  final String? email;

  const SignInEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

final class SignInPasswordChanged extends SignInEvent {
  final String? password;

  const SignInPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}
