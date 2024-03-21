import 'package:fpdart/fpdart.dart';

import 'package:auth_service/auth_service.dart';
import 'package:core_utils/core_utils.dart';

abstract interface class AuthRepository {
  StreamEither<User?> authStateChanges();

  FutureEither<void> signIn({
    required String email,
    required String password,
  });

  FutureEither<void> signUp({
    required String username,
    required String email,
    required String password,
  });

  FutureEither<void> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  const AuthRepositoryImpl({
    required AuthService authService,
  }) : _authService = authService;

  @override
  StreamEither<User?> authStateChanges() async* {
    try {
      final Stream<User?> userStream = _authService.authStateChanges();

      await for (final User? user in userStream) {
        yield Right<Failure, User?>(user);
      }
    } on NetworkException catch (exception) {
      yield Left(NetworkFailure(exception));
    } on ServerException catch (exception) {
      yield Left(ServerFailure(exception));
    } on UnexpectedException catch (exception) {
      yield Left(UnexpectedFailure(exception));
    }
  }

  @override
  FutureEither<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _authService.signIn(email: email, password: password);
      return const Right(null);
    } on ServerException catch (exception) {
      return Left(ServerFailure(exception));
    } on NetworkException catch (exception) {
      return Left(NetworkFailure(exception));
    } on UnexpectedException catch (exception) {
      return Left(UnexpectedFailure(exception));
    }
  }

  @override
  FutureEither<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await _authService.signUp(
        username: username,
        email: email,
        password: password,
      );
      return const Right(null);
    } on ServerException catch (exception) {
      return Left(ServerFailure(exception));
    } on NetworkException catch (exception) {
      return Left(NetworkFailure(exception));
    } on UnexpectedException catch (exception) {
      return Left(UnexpectedFailure(exception));
    }
  }

  @override
  FutureEither<void> signOut() async {
    try {
      await _authService.signOut();
      return const Right(null);
    } on ServerException catch (exception) {
      return Left(ServerFailure(exception));
    } on NetworkException catch (exception) {
      return Left(NetworkFailure(exception));
    } on UnexpectedException catch (exception) {
      return Left(UnexpectedFailure(exception));
    }
  }
}
