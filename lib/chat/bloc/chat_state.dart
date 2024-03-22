part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(null) Failure? failure,
    // form
    @Default(MessageInput.pure()) MessageInput messageInput,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState();
}
