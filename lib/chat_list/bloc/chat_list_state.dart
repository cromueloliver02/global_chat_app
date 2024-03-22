part of 'chat_list_bloc.dart';

enum LoadChatListStatus { initial, inProgress, success, failure }

extension LoadChatListStatusX on LoadChatListStatus {
  bool get isInitial => this == LoadChatListStatus.initial;
  bool get isInProgress => this == LoadChatListStatus.inProgress;
  bool get isSuccess => this == LoadChatListStatus.success;
  bool get isFailure => this == LoadChatListStatus.failure;
}

@freezed
class ChatListState with _$ChatListState {
  const ChatListState._();

  const factory ChatListState({
    @Default(<ChatBubble>[]) List<ChatBubble> chatBubbles,
    @Default(LoadChatListStatus.initial) LoadChatListStatus status,
    @Default(null) Failure? failure,
  }) = _ChatListState;

  factory ChatListState.initial() => const ChatListState();

  factory ChatListState.inProgress() {
    return const ChatListState(status: LoadChatListStatus.inProgress);
  }

  factory ChatListState.success(List<ChatBubble> chatBubbles) {
    return ChatListState(
      chatBubbles: chatBubbles,
      status: LoadChatListStatus.success,
    );
  }

  factory ChatListState.failure(Failure failure) {
    return ChatListState(
      status: LoadChatListStatus.failure,
      failure: failure,
    );
  }
}
