import 'package:flutter/material.dart';

class ChatRoomAppBar extends StatelessWidget {
  final String chatRoomName;

  const ChatRoomAppBar({
    super.key,
    required this.chatRoomName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(chatRoomName),
    );
  }
}
