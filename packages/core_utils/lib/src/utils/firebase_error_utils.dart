import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:core_utils/core_utils.dart';

class FirebaseErrorUtils {
  const FirebaseErrorUtils._();

  static Exception handleFirebaseException(
    firestore.FirebaseException error, {
    required StackTrace stackTrace,
  }) {
    if (error.code == FirebaseErrorCode.networkRequestFailed) {
      return NetworkException(
        error,
        stackTrace: error.stackTrace ?? stackTrace,
        message: error.message ?? NetworkException.defaultMessage,
      );
    }

    return ServerException(
      error.code,
      error,
      stackTrace: error.stackTrace ?? stackTrace,
      message: error.message ?? ServerException.defaultMessage,
    );
  }
}
