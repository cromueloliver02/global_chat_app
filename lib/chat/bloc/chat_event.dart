part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

final class ChatMessageSent extends ChatEvent {
  final String text;
  final String chatRoomId;
  final String senderId;

  const ChatMessageSent({
    required this.text,
    required this.chatRoomId,
    required this.senderId,
  });

  @override
  List<Object> get props => [text, chatRoomId, senderId];
}
