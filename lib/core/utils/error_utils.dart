import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:core_utils/core_utils.dart';

import 'package:global_chat/core/error_infos/error_infos.dart';
import 'package:global_chat/core/models/models.dart';
import 'package:global_chat/core/utils/firebase_codes.dart';

class ErrorUtils {
  const ErrorUtils._();

  static ErrorDetails generateError(Failure failure) {
    switch (failure) {
      case NetworkFailure():
        return NetworkErrorInfo(failure).generateError();
      case ServerFailure():
        return ServerErrorInfo(failure).generateError();
      case UnexpectedFailure():
        return UnexpectedErrorInfo(failure).generateError();
    }
  }

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
