import 'package:auth_repository/auth_repository.dart';
import 'package:auth_service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:global_chat/auth/bloc/auth_bloc.dart';
import 'package:global_chat/injection/injection_container.dart';
import 'package:global_chat/router/app_router.dart';
import 'package:global_chat/theme/app_theme.dart';

class GlobalChatApp extends StatelessWidget {
  const GlobalChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (ctx) => AuthRepositoryImpl(authService: sl<AuthService>()),
      child: BlocProvider<AuthBloc>(
        create: (ctx) => AuthBloc(authRepository: ctx.read<AuthRepository>()),
        child: const GlobalChatAppView(),
      ),
    );
  }
}

class GlobalChatAppView extends StatelessWidget {
  const GlobalChatAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Global Chat App',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routerConfig,
    );
  }
}
