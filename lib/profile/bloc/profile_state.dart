part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();

  const factory ProfileState({
    @Default(null) Profile? profile,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(null) Failure? failure,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState();
}
