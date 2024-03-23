import 'package:auth_service/auth_service.dart';
import 'package:chat_service/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:uuid/uuid.dart';

import 'package:global_chat/auth/bloc/auth_bloc.dart';
import 'package:global_chat/chat/bloc/chat_bloc.dart';
import 'package:global_chat/chat_list/bloc/chat_list_bloc.dart';
import 'package:global_chat/core/formz_inputs/formz_inputs.dart';
import 'package:global_chat/core/widgets/widgets.dart';

class ChatTextField extends StatefulWidget {
  final String chatRoomId;

  const ChatTextField({
    super.key,
    required this.chatRoomId,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  late final TextEditingController _controller;

  void _sendMessage(BuildContext ctx) {
    final ChatBloc chatBloc = ctx.read<ChatBloc>();
    final User sender = ctx.read<AuthBloc>().state.user!;

    if (chatBloc.state.messageInput.isNotValid) return;

    final Message message = Message(
      id: const Uuid().v4(),
      text: chatBloc.state.messageInput.value!,
      chatRoomId: widget.chatRoomId,
      senderId: sender.uid,
      timestamp: DateTime.timestamp(),
    );
    final ChatBubble chatBubble = ChatBubble(
      id: const Uuid().v4(),
      message: message,
      sender: sender,
      sent: false,
    );

    ctx.read<ChatListBloc>().add(ChatListPendingMessageAdded(chatBubble));
    chatBloc.add(
      ChatMessageSent(
        chatRoomId: widget.chatRoomId,
        senderId: sender.uid,
      ),
    );

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                buildWhen: (prev, curr) =>
                    prev.messageInput != curr.messageInput,
                builder: (ctx, state) => GCATextField(
                  controller: _controller,
                  enableFeedback: false,
                  hintText: 'Message',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  validator: (v) => state.messageInput.validator(v)?.text(),
                  onChanged: (v) =>
                      ctx.read<ChatBloc>().add(ChatMessageChanged(v)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => _sendMessage(context),
              icon: const Icon(
                IconlyBold.send,
                color: Colors.deepPurple,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
