import 'package:auth_firebase_service/auth_firebase_service.dart';
import 'package:auth_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:get_it/get_it.dart';

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
}
