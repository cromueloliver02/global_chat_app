part of 'chat_room_bloc.dart';

sealed class ChatRoomEvent extends Equatable {
  const ChatRoomEvent();

  @override
  List<Object> get props => [];
}

final class ChatRoomsLoaded extends ChatRoomEvent {
  const ChatRoomsLoaded();
}
