import 'package:auth_firebase_service/auth_firebase_service.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:auth_service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get_it/get_it.dart';

import 'package:global_chat/auth/bloc/auth_bloc.dart';

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

  // these dependencies below are injected via sl instead of RepositoryProvider
  // and BlocProvider because they are being accessed in the app-level

  // repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authService: sl<AuthService>()),
  );

  // blocs
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(authRepository: sl<AuthRepository>()),
  );
}
