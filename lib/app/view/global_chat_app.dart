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
    return BlocProvider<AuthBloc>.value(
      value: sl<AuthBloc>(),
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
  Future<void> _initializeApp() async {
    try {
      final AuthBloc authBloc = context.read<AuthBloc>();

      authBloc.add(const AuthStateChangesSubscribed());

      // to let the splash screen hide the unwanted transitions of the
      // the sign in page
      await authBloc.completer.future;
      await Future<void>.delayed(const Duration(milliseconds: 500));
      FlutterNativeSplash.remove();
    } catch (error) {
      // proceed to onboarding/login page anyway
      FlutterNativeSplash.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Global Chat App',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.routerConfig,
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }
}
