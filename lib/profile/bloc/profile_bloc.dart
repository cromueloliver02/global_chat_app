import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:profile_service/profile_service.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(ProfileState.initial()) {
    on<ProfileLoaded>(_onProfileLoaded);
  }

  Future<void> _onProfileLoaded(
    ProfileLoaded event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(loadStatus: LoadProfileStatus.inProgress));

    final Either<Failure, Profile> either =
        await _profileRepository.getProfile();

    // just to show the splash page
    await Future.delayed(const Duration(seconds: 1));

    either.fold(
      (Failure failure) {
        debugPrint(failure.toString());
        emit(
          state.copyWith(
            loadStatus: LoadProfileStatus.failure,
            failure: failure,
          ),
        );
      },
      (Profile profile) => emit(
        state.copyWith(
          profile: profile,
          loadStatus: LoadProfileStatus.success,
        ),
      ),
    );
  }
}
