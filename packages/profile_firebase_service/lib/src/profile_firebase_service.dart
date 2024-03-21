import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:core_utils/core_utils.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:profile_service/profile_service.dart';

class ProfileFirebaseService implements ProfileService {
  final auth.FirebaseAuth _firebaseAuth;
  final firestore.FirebaseFirestore _firebaseFirestore;

  const ProfileFirebaseService({
    required auth.FirebaseAuth firebaseAuth,
    required firestore.FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<Profile> getProfile() async {
    try {
      final firestore.DocumentSnapshot<JsonMap> profileDocSnap =
          await _firebaseFirestore
              .collection(kUsersCollection)
              .doc(_firebaseAuth.currentUser!.uid)
              .get();

      if (!profileDocSnap.exists) {
        throw ServerException(
          HttpStatus.notFound.toString(),
          Exception('User is null'),
          message: 'User is not found',
          stackTrace: StackTrace.current,
        );
      }

      final Profile profile = Profile.fromJson(profileDocSnap.data()!);

      return profile;
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
}
