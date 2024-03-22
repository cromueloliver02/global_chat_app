import 'package:chat_room_service/chat_room_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:global_chat/chat_room/bloc/chat_room_bloc.dart';
import 'package:global_chat/core/widgets/widgets.dart';
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

  Widget _chatRoomTileBuilder(ChatRoom chatRoom) {
    final ChatRoom(:name, :description) = chatRoom;
    return GCAChatRoomTile(name: name, description: description);
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
          itemBuilder: (ctx, idx) => _chatRoomTileBuilder(state.chatRooms[idx]),
        ),
      ),
    );
  }
}
