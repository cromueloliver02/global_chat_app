part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const SignInState._();

  const factory SignInState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(null) Failure? failure,
    // form
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(EmailInput.pure()) EmailInput emailInput,
    @Default(PasswordInput.pure()) PasswordInput passwordInput,
  }) = _SignInState;

  factory SignInState.initial() => const SignInState();
}
