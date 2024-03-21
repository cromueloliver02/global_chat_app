import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:global_chat/core/formz_inputs/formz_inputs.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<SignUpUsernameChanged>(_onSignUpUsernameChanged);
    on<SignUpEmailChanged>(_onSignUpEmailChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {}

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
