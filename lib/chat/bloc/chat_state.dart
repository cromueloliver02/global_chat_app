part of 'chat_bloc.dart';

enum ChatSendMessageStatus { initial, inProgress, success, failure }

extension ChatSendMessageStatusX on ChatSendMessageStatus {
  bool get isInitial => this == ChatSendMessageStatus.initial;
  bool get isInProgress => this == ChatSendMessageStatus.inProgress;
  bool get isSuccess => this == ChatSendMessageStatus.success;
  bool get isFailure => this == ChatSendMessageStatus.failure;
}

@freezed
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    @Default(ChatSendMessageStatus.initial) ChatSendMessageStatus status,
    @Default(null) Failure? failure,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState();

  factory ChatState.inProgress() {
    return const ChatState(status: ChatSendMessageStatus.inProgress);
  }

  factory ChatState.success() {
    return const ChatState(status: ChatSendMessageStatus.success);
  }

  factory ChatState.failure(Failure failure) {
    return ChatState(
      status: ChatSendMessageStatus.failure,
      failure: failure,
    );
  }
}
