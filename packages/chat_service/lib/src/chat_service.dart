import 'package:chat_service/src/models/chat_bubble/chat_bubble_model.dart';
import 'package:chat_service/src/models/message/message_model.dart';

abstract interface class ChatService {
  Stream<List<ChatBubble>> loadMessages(String chatRoomId);

  Future<void> sendMessage(Message message);
}
