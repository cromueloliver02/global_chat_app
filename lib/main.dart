import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:global_chat/app/view/global_chat_app.dart';
import 'package:global_chat/firebase_options.dart';
import 'package:global_chat/injection/injection_container.dart' as di;

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  di.inject();

  runApp(const GlobalChatApp());
}
