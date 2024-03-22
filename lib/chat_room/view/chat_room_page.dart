import 'package:chat_repository/chat_repository.dart';
import 'package:chat_service/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import 'package:global_chat/chat_list/bloc/chat_list_bloc.dart';
import 'package:global_chat/chat_room/widgets/char_room_app_bar.dart';
import 'package:global_chat/core/widgets/widgets.dart';
import 'package:global_chat/injection/injection_container.dart';

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
    return RepositoryProvider<ChatRepository>(
      create: (ctx) => ChatRepositoryImpl(chatService: sl<ChatService>()),
      child: BlocProvider<ChatListBloc>(
        create: (ctx) => ChatListBloc(
          chatRepository: ctx.read<ChatRepository>(),
        ),
        child: ChatRoomView(chatRoomId: chatRoomId, chatRoomName: chatRoomName),
      ),
    );
  }
}

class ChatRoomView extends StatefulWidget {
  final String chatRoomId;
  final String chatRoomName;

  const ChatRoomView({
    super.key,
    required this.chatRoomId,
    required this.chatRoomName,
  });

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  @override
  Widget build(BuildContext context) {
    return GCAKeyboardDismisser(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ChatRoomAppBar(chatRoomName: widget.chatRoomName),
        ),
        body: Column(
          children: [
            const Expanded(child: SizedBox()), // implement chat bubbles
            Container(
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(20),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: GCATextField(
                        enableFeedback: false,
                        hintText: 'Message',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      IconlyBold.send,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                  ],
                ),
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
    context.read<ChatListBloc>().add(ChatListLoaded(widget.chatRoomId));
  }
}
