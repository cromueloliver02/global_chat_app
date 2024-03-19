import 'package:flutter/material.dart';

class GlobalChatApp extends StatelessWidget {
  const GlobalChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Chat App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('GLOBAL CHAT APP'),
        ),
      ),
    );
  }
}
