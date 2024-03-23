import 'package:chat_service/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:global_chat/auth/bloc/auth_bloc.dart';
import 'package:global_chat/chat_list/bloc/chat_list_bloc.dart';
import 'package:global_chat/core/widgets/widgets.dart';

class ChatBubbleList extends StatelessWidget {
  const ChatBubbleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatListBloc, ChatListState>(
      buildWhen: (prev, curr) => prev.chatBubbles != curr.chatBubbles,
      builder: (ctx, chatState) {
        if (chatState.status.isInitial || chatState.status.isInProgress) {
          return const GCALoadingCard();
        }

        if (chatState.status.isFailure) {
          return const GCAErrorCard(
            message: 'Something went wrong loading messages',
          );
        }

        if (chatState.chatBubbles.isEmpty) {
          return const GCAEmptyCard(
            message: 'Start chatting by sending "hello"',
          );
        }

        return BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (prev, curr) => prev.user!.uid != curr.user!.uid,
          builder: (ctx, authState) => ListView.separated(
            reverse: true,
            padding: const EdgeInsets.only(bottom: 20, left: 10),
            itemCount: chatState.chatBubbles.length,
            separatorBuilder: (ctx, idx) => const SizedBox(height: 5),
            itemBuilder: (ctx, idx) {
              final ChatBubble chatBubble = chatState.chatBubbles[idx];
              final bool isSender =
                  authState.user!.uid == chatBubble.sender.uid;

              return GCAChatBubble(
                chatBubble: chatBubble,
                isSender: isSender,
              );
            },
          ),
        );
      },
    );
  }
}
