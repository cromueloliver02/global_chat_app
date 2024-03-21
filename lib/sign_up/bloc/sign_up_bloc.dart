import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:global_chat/core/formz_inputs/formz_inputs.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _authRepository;

  SignUpBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SignUpState.initial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<SignUpUsernameChanged>(_onSignUpUsernameChanged);
    on<SignUpEmailChanged>(_onSignUpEmailChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(autovalidateMode: AutovalidateMode.always));

    final bool isValid = Formz.validate([
      state.usernameInput,
      state.emailInput,
      state.passwordInput,
    ]);

    if (!isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final Either<Failure, void> either = await _authRepository.signUp(
      username: state.usernameInput.value!,
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
      (_) => emit(const SignUpState(status: FormzSubmissionStatus.success)),
    );
  }

  void _onSignUpUsernameChanged(
    SignUpUsernameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final UsernameInput usernameInput =
        UsernameInput.dirty(event.username ?? '');

    emit(state.copyWith(usernameInput: usernameInput));
  }

  void _onSignUpEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    final EmailInput emailInput = EmailInput.dirty(event.email ?? '');

    emit(state.copyWith(emailInput: emailInput));
  }

  void _onSignUpPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final PasswordInput passwordInput =
        PasswordInput.dirty(event.password ?? '');

    emit(state.copyWith(passwordInput: passwordInput));
  }
}
