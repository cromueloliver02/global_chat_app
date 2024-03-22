import 'package:flutter/material.dart';

import 'package:global_chat/chat_room/widgets/char_room_app_bar.dart';

class ChatRoomPage extends StatelessWidget {
  final String chatRoomId;
  final String chatRoomName;

  const ChatRoomPage({
    super.key,
    required this.chatRoomId,
    required this.chatRoomName,
  });

  static const String chatRoomIdKey = 'chat_room_id';
  static const String chatRoomNameKey = 'chat_room_name';
  static const String routeName = 'chat_room';
  static const String routePath = 'chat_rooms/:$chatRoomIdKey';

  @override
  Widget build(BuildContext context) {
    return ChatRoomView(chatRoomId: chatRoomId, chatRoomName: chatRoomName);
  }
}

class ChatRoomView extends StatelessWidget {
  final String chatRoomId;
  final String chatRoomName;

  const ChatRoomView({
    super.key,
    required this.chatRoomId,
    required this.chatRoomName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ChatRoomAppBar(chatRoomName: chatRoomName),
      ),
      body: const Center(
        child: Text('CHAT ROOM PAGE'),
      ),
    );
  }
}
