import 'package:flutter/material.dart';

import 'package:global_chat/core/utils/helpers.dart';

class GCAChatRoomTile extends StatelessWidget {
  final String name;
  final String description;

  const GCAChatRoomTile({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(getInitial(name))),
      title: Text(name),
      subtitle: Text(
        description,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
