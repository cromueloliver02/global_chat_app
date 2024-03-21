import 'dart:async';

import 'package:auth_service/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.unknown()) {
    on<AuthStatusChangesSubscribed>(_onAuthStatusChangesSubscribed);
    on<AuthSignedOut>(_onAuthSignedOut);
  }

  Future<void> _onAuthStatusChangesSubscribed(
    AuthStatusChangesSubscribed event,
    Emitter<AuthState> emit,
  ) async {}

  Future<void> _onAuthSignedOut(
    AuthSignedOut event,
    Emitter<AuthState> emit,
  ) async {}
}
