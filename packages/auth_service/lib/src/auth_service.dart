import 'package:auth_service/auth_service.dart';

abstract interface class AuthService {
  Stream<User?> authStateChanges();

  Future<void> signIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<void> signOut();
}
