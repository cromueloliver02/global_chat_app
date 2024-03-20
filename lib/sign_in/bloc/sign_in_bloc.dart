import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:global_chat/core/error/failures/failure.dart';
import 'package:global_chat/core/formz_inputs/formz_inputs.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    on<SignInSubmitted>(_onSignInSubmitted);
    on<SignInEmailChanged>(_onAuthEmailChanged);
    on<SignInPasswordChanged>(_onSignInPasswordChanged);
  }

  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {}

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
