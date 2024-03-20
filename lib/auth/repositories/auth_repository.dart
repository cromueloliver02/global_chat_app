import 'package:global_chat/auth/models/user/user_model.dart';
import 'package:global_chat/core/utils/typedefs.dart';

abstract interface class AuthRepository {
  StreamEither<User> authStateChanges();

  FutureEither<void> signIn({
    required String email,
    required String password,
  });

  FutureEither<void> signUp({
    required String username,
    required String email,
    required String password,
  });
}
