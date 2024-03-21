import 'dart:io';

import 'package:auth_firebase_service/src/utils/constants.dart';
import 'package:auth_service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:core_utils/core_utils.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthFirebaseService implements AuthService {
  final auth.FirebaseAuth _firebaseAuth;
  final firestore.FirebaseFirestore _firebaseFirestore;

  const AuthFirebaseService({
    required auth.FirebaseAuth firebaseAuth,
    required firestore.FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Stream<User?> authStateChanges() async* {
    try {
      final Stream<auth.User?> authStream = _firebaseAuth.authStateChanges();

      // this is a hacky fix for instantious asynchronous operation
      await Future<void>.delayed(const Duration(milliseconds: 500));

      await for (final auth.User? user in authStream) {
        if (user == null) yield null;

        if (user != null) {
          yield User(
            uid: user.uid,
            username: user.displayName ?? 'anonymous',
            email: user.email ?? '',
            profileUrl: user.photoURL ?? kDefaultAvatarUrl,
          );
        }
      }
    } on firestore.FirebaseException catch (error, stackTrace) {
      throw FirebaseErrorUtils.handleFirebaseException(
        error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw UnexpectedException(error, stackTrace: stackTrace);
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firestore.FirebaseException catch (error, stackTrace) {
      throw FirebaseErrorUtils.handleFirebaseException(
        error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw UnexpectedException(error, stackTrace: stackTrace);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on firestore.FirebaseException catch (error, stackTrace) {
      throw FirebaseErrorUtils.handleFirebaseException(
        error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw UnexpectedException(error, stackTrace: stackTrace);
    }
  }

  @override
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final auth.UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final auth.User? user = userCredential.user;

      if (user == null) {
        throw ServerException(
          HttpStatus.notFound.toString(),
          Exception('User is null'),
          message: 'User is not found',
          stackTrace: StackTrace.current,
        );
      }

      await user.updateDisplayName(username);
      await user.updatePhotoURL(kDefaultAvatarUrl);
      await _setUserData(user, email, username);
    } on ServerException {
      rethrow;
    } on firestore.FirebaseException catch (error, stackTrace) {
      throw FirebaseErrorUtils.handleFirebaseException(
        error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw UnexpectedException(error, stackTrace: stackTrace);
    }
  }

  Future<void> _setUserData(
    auth.User firebaseUser,
    String fallbackEmail,
    String fallbackUsername,
  ) async {
    final User user = User(
      uid: firebaseUser.uid,
      username: firebaseUser.displayName ?? fallbackUsername,
      email: firebaseUser.email ?? fallbackEmail,
      profileUrl: firebaseUser.photoURL ?? kDefaultAvatarUrl,
    );

    return _firebaseFirestore
        .collection(kUsersCollection)
        .doc(firebaseUser.uid)
        .set(user.toJson());
  }
}
