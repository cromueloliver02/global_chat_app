import 'package:chat_room_service/chat_room_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:global_chat/chat_room/bloc/chat_room_bloc.dart';
import 'package:global_chat/chat_room/view/chat_room_page.dart';
import 'package:global_chat/chat_room/widgets/chat_room_tile.dart';
import 'package:global_chat/home/widgets/home_app_bar.dart';
import 'package:global_chat/home/widgets/home_drawer.dart';
import 'package:global_chat/injection/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = 'home';
  static const String routePath = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatRoomBloc>.value(
      value: sl<ChatRoomBloc>(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Widget _chatRoomTileBuilder(BuildContext ctx, {required ChatRoom chatRoom}) {
    final ChatRoom(:id, :name, :description) = chatRoom;

    return ChatRoomTile(
      name: name,
      description: description,
      onTap: () => ctx.goNamed(
        ChatRoomPage.routeName,
        pathParameters: {ChatRoomPage.chatRoomIdKey: id},
        queryParameters: {ChatRoomPage.chatRoomNameKey: name},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(),
      ),
      drawer: const HomeDrawer(),
      body: BlocBuilder<ChatRoomBloc, ChatRoomState>(
        buildWhen: (prev, curr) => prev.chatRooms != curr.chatRooms,
        builder: (ctx, state) => ListView.builder(
          itemCount: state.chatRooms.length,
          itemBuilder: (ctx, idx) => _chatRoomTileBuilder(
            context,
            chatRoom: state.chatRooms[idx],
          ),
        ),
      ),
    );
  }
}
