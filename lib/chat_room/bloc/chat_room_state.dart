part of 'chat_room_bloc.dart';

enum LoadChatRoomsStatus { initial, inProgress, success, failure }

extension LoadChatRoomsStatusX on LoadChatRoomsStatus {
  bool get isInitial => this == LoadChatRoomsStatus.initial;
  bool get isInProgress => this == LoadChatRoomsStatus.inProgress;
  bool get isSuccess => this == LoadChatRoomsStatus.success;
  bool get isFailure => this == LoadChatRoomsStatus.failure;
}

@freezed
class ChatRoomState with _$ChatRoomState {
  const ChatRoomState._();

  const factory ChatRoomState({
    @Default(<ChatRoom>[]) List<ChatRoom> chatRooms,
    @Default(LoadChatRoomsStatus.initial) LoadChatRoomsStatus loadStatus,
    @Default(null) Failure? failure,
  }) = _ChatRoomState;

  factory ChatRoomState.initial() => const ChatRoomState();

  factory ChatRoomState.inProgress() {
    return const ChatRoomState(loadStatus: LoadChatRoomsStatus.inProgress);
  }

  factory ChatRoomState.success(List<ChatRoom> chatRooms) {
    return ChatRoomState(
      chatRooms: chatRooms,
      loadStatus: LoadChatRoomsStatus.success,
    );
  }

  factory ChatRoomState.failure(Failure failure) {
    return ChatRoomState(
      loadStatus: LoadChatRoomsStatus.success,
      failure: failure,
    );
  }
}
