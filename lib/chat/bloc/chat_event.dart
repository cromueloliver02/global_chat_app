part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

final class ChatMessageSent extends ChatEvent {
  final String chatRoomId;
  final String senderId;

  const ChatMessageSent({
    required this.chatRoomId,
    required this.senderId,
  });

  @override
  List<Object> get props => [chatRoomId, senderId];
}

final class ChatMessageChanged extends ChatEvent {
  final String message;

  const ChatMessageChanged(this.message);

  @override
  List<Object> get props => [message];
}
