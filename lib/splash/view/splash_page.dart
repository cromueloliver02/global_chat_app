import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import 'package:global_chat/chat_room/bloc/chat_room_bloc.dart';
import 'package:global_chat/core/res/app_images.dart';
import 'package:global_chat/home/view/home_page.dart';
import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/profile/bloc/profile_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routeName = 'splash';
  static const String routePath = '/$routeName';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>.value(value: sl<ProfileBloc>()),
        BlocProvider<ChatRoomBloc>.value(value: sl<ChatRoomBloc>()),
      ],
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> _initializeApp() async {
    try {
      final ProfileBloc profileBloc = context.read<ProfileBloc>();
      final ChatRoomBloc chatRoomBloc = context.read<ChatRoomBloc>();
      final GoRouter router = GoRouter.of(context);

      profileBloc.add(const ProfileLoaded());
      chatRoomBloc.add(const ChatRoomsLoaded());

      await Future.wait<void>([
        profileBloc.completer.future,
        chatRoomBloc.completer.future,
      ]);

      router.goNamed(HomePage.routeName);
    } catch (error) {
      // implement proper error handler
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(142),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppImages.splash),
            const Padding(
              padding: EdgeInsets.only(top: 300),
              child: SpinKitFadingCircle(
                color: Colors.deepPurple,
                size: 50,
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
    _initializeApp();
  }
}
