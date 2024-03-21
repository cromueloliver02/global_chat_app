part of 'profile_bloc.dart';

enum LoadProfileStatus { initial, inProgress, success, failure }

extension LoadProfileStatusX on LoadProfileStatus {
  bool get isInitial => this == LoadProfileStatus.initial;
  bool get isInProgress => this == LoadProfileStatus.inProgress;
  bool get isSuccess => this == LoadProfileStatus.success;
  bool get isFailure => this == LoadProfileStatus.failure;
}

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  const factory ProfileState({
    @Default(null) Profile? profile,
    @Default(LoadProfileStatus.initial) LoadProfileStatus loadStatus,
    @Default(null) Failure? failure,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState();
}
