import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:global_chat/core/formz_inputs/formz_inputs.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;

  SignInBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SignInState.initial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
    on<SignInEmailChanged>(_onAuthEmailChanged);
    on<SignInPasswordChanged>(_onSignInPasswordChanged);
  }

  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(autovalidateMode: AutovalidateMode.always));

    final bool isValid = Formz.validate([
      state.emailInput,
      state.passwordInput,
    ]);

    if (!isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final Either<Failure, void> either = await _authRepository.signIn(
      email: state.emailInput.value!,
      password: state.passwordInput.value!,
    );

    either.fold(
      (Failure failure) {
        debugPrint(failure.toString());
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            failure: failure,
          ),
        );
      },
      (_) => emit(const SignInState(status: FormzSubmissionStatus.success)),
    );
  }

  void _onAuthEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    final EmailInput emailInput = EmailInput.dirty(event.email ?? '');

    emit(state.copyWith(emailInput: emailInput));
  }

  void _onSignInPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    final PasswordInput passwordInput =
        PasswordInput.dirty(event.password ?? '');

    emit(state.copyWith(passwordInput: passwordInput));
  }
}
