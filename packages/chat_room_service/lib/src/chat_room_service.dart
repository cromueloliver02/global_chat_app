import 'package:chat_room_service/src/models/chat_room/chat_room_model.dart';

abstract interface class ChatRoomService {
  Future<List<ChatRoom>> loadChatRooms();
}
