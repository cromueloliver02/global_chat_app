import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:auth_service/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(AuthState.unknown()) {
    on<AuthStateChangesSubscribed>(_onAuthStateChangesSubscribed);
    on<AuthSignedOut>(_onAuthSignedOut);
  }

  Future<void> _onAuthStateChangesSubscribed(
    AuthStateChangesSubscribed event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(subscribeStatus: AuthSubscribeStatus.inProgress));

    final StreamEither<User?> eitherStream = _authRepository.authStateChanges();

    await emit.onEach<Either<Failure, User?>>(
      eitherStream,
      onData: (Either<Failure, User?> either) => either.fold(
        (Failure failure) {
          debugPrint(failure.toString());
          emit(AuthState.unauthenticated(failure));
        },
        (User? user) {
          if (user != null) emit(AuthState.authenticated(user));

          if (user == null) emit(AuthState.unauthenticated());
        },
      ),
    );
  }

  Future<void> _onAuthSignedOut(
    AuthSignedOut event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(signOutStatus: AuthSignOutStatus.inProgress));

    final Either<Failure, void> either = await _authRepository.signOut();

    either.fold(
      (Failure failure) {
        debugPrint(failure.toString());
        emit(
          state.copyWith(
            signOutStatus: AuthSignOutStatus.failure,
            failure: failure,
          ),
        );
      },
      (_) => emit(state.copyWith(signOutStatus: AuthSignOutStatus.success)),
    );
  }
}
