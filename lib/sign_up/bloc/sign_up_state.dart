part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(null) Failure? failure,
    // form
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(UsernameInput.pure()) UsernameInput usernameInput,
    @Default(EmailInput.pure()) EmailInput emailInput,
    @Default(PasswordInput.pure()) PasswordInput passwordInput,
  }) = _SignUpState;

  factory SignUpState.initial() => const SignUpState();
}
