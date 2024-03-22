import 'package:auth_firebase_service/auth_firebase_service.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:auth_service/auth_service.dart';
import 'package:chat_firebase_service/chat_firebase_service.dart';
import 'package:chat_room_firebase_service/chat_room_firebase_service.dart';
import 'package:chat_room_repository/chat_room_repository.dart';
import 'package:chat_room_service/chat_room_service.dart';
import 'package:chat_service/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get_it/get_it.dart';
import 'package:profile_firebase_service/profile_firebase_service.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:profile_service/profile_service.dart';

import 'package:global_chat/auth/bloc/auth_bloc.dart';
import 'package:global_chat/chat_room/bloc/chat_room_bloc.dart';
import 'package:global_chat/profile/bloc/profile_bloc.dart';

final GetIt sl = GetIt.instance;

void inject() {
  // external dependencies
  sl.registerLazySingleton<auth.FirebaseAuth>(() => auth.FirebaseAuth.instance);
  sl.registerLazySingleton<firestore.FirebaseFirestore>(
    () => firestore.FirebaseFirestore.instance,
  );

  // services
  sl.registerLazySingleton<AuthService>(
    () => AuthFirebaseService(
      firebaseAuth: sl<auth.FirebaseAuth>(),
      firebaseFirestore: sl<firestore.FirebaseFirestore>(),
    ),
  );
  sl.registerLazySingleton<ProfileService>(
    () => ProfileFirebaseService(
      firebaseAuth: sl<auth.FirebaseAuth>(),
      firebaseFirestore: sl<firestore.FirebaseFirestore>(),
    ),
  );
  sl.registerLazySingleton<ChatRoomService>(
    () => ChatRoomFirebaseService(
      firebaseFirestore: sl<firestore.FirebaseFirestore>(),
    ),
  );
  sl.registerLazySingleton<ChatService>(
    () => ChatFirebaseService(
      firebaseFirestore: sl<firestore.FirebaseFirestore>(),
    ),
  );

  // these dependencies below are injected via sl instead of RepositoryProvider
  // and BlocProvider because they are being accessed in the app-level

  // repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authService: sl<AuthService>()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(profileService: sl<ProfileService>()),
  );
  sl.registerLazySingleton<ChatRoomRepository>(
    () => ChatRoomRepositoryImpl(chatRoomService: sl<ChatRoomService>()),
  );

  // blocs
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(authRepository: sl<AuthRepository>()),
  );
  sl.registerLazySingleton<ProfileBloc>(
    () => ProfileBloc(profileRepository: sl<ProfileRepository>()),
  );
  sl.registerLazySingleton<ChatRoomBloc>(
    () => ChatRoomBloc(chatRoomRepository: sl<ChatRoomRepository>()),
  );
}
