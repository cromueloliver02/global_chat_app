part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

final class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}

final class SignUpUsernameChanged extends SignUpEvent {
  final String? username;

  const SignUpUsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

final class SignUpEmailChanged extends SignUpEvent {
  final String? email;

  const SignUpEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

final class SignUpPasswordChanged extends SignUpEvent {
  final String? password;

  const SignUpPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}
