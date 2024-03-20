import 'package:flutter/material.dart';

import 'package:global_chat/router/app_router.dart';
import 'package:global_chat/theme/app_theme.dart';

class GlobalChatApp extends StatelessWidget {
  const GlobalChatApp({super.key});

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
