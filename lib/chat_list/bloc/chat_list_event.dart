part of 'chat_list_bloc.dart';

sealed class ChatListEvent extends Equatable {
  const ChatListEvent();

  @override
  List<Object> get props => [];
}

final class ChatListLoaded extends ChatListEvent {
  final String chatRoomId;

  const ChatListLoaded(this.chatRoomId);

  @override
  List<Object> get props => [chatRoomId];
}

final class ChatListPendingMessageAdded extends ChatListEvent {
  final ChatBubble chatBubble;

  const ChatListPendingMessageAdded(this.chatBubble);

  @override
  List<Object> get props => [chatBubble];
}
