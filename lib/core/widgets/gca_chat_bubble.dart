import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_service/chat_service.dart';
import 'package:flutter/material.dart';

class GCAChatBubble extends StatelessWidget {
  final ChatBubble chatBubble;
  final bool isSender;

  const GCAChatBubble({
    super.key,
    required this.chatBubble,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    if (isSender) {
      return BubbleSpecialThree(
        isSender: true,
        text: chatBubble.message.text,
        color: Colors.deepPurple,
        tail: true,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox.square(
          dimension: 20,
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              chatBubble.sender.profileUrl,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                chatBubble.sender.username,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            BubbleSpecialThree(
              isSender: false,
              text: chatBubble.message.text,
              color: Colors.grey.shade600,
              tail: true,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
