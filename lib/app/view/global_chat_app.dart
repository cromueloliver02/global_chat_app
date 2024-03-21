import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:global_chat/auth/bloc/auth_bloc.dart';
import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/router/app_router.dart';
import 'package:global_chat/theme/app_theme.dart';

class GlobalChatApp extends StatelessWidget {
  const GlobalChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (ctx) => sl<AuthBloc>(),
      child: const GlobalChatAppView(),
    );
  }
}

class GlobalChatAppView extends StatefulWidget {
  const GlobalChatAppView({super.key});

  @override
  State<GlobalChatAppView> createState() => _GlobalChatAppViewState();
}

class _GlobalChatAppViewState extends State<GlobalChatAppView> {
  void _authListener(BuildContext ctx, AuthState state) {
    if (state.subscribeStatus.isSuccess) FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (prev, curr) => prev.subscribeStatus != curr.subscribeStatus,
      listener: _authListener,
      child: MaterialApp.router(
        title: 'Global Chat App',
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routerConfig,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthStateChangesSubscribed());
  }
}
