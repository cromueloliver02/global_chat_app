import 'package:chat_service/src/models/message/message_model.dart';

abstract interface class ChatService {
  Stream<List<Message>> loadMessages();

  Future<Message> sendMessage();
}
