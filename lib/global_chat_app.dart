import 'package:flutter/material.dart';

import 'package:global_chat/theme/app_theme.dart';

class GlobalChatApp extends StatelessWidget {
  const GlobalChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Chat App',
      theme: AppTheme.light,
      home: const Scaffold(
        body: Center(
          child: Text('GLOBAL CHAT APP'),
        ),
      ),
    );
  }
}
