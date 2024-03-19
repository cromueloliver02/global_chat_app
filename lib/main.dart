import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:global_chat/firebase_options.dart';
import 'package:global_chat/global_chat_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const GlobalChatApp());
}
