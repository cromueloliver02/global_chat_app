import 'package:flutter/material.dart';

import 'package:global_chat/core/utils/helpers.dart';

class ChatRoomTile extends StatelessWidget {
  final String name;
  final String description;
  final VoidCallback onTap;

  const ChatRoomTile({
    super.key,
    required this.name,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(child: Text(getInitial(name))),
      title: Text(name),
      subtitle: Text(
        description,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
