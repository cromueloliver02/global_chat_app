import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

import 'package:global_chat/core/error/error_infos/network_error_info.dart';
import 'package:global_chat/core/error/error_infos/server_error_info.dart';
import 'package:global_chat/core/error/error_infos/unexpected_error_info.dart';
import 'package:global_chat/core/error/exceptions/exceptions.dart';
import 'package:global_chat/core/error/failures/failure.dart';
import 'package:global_chat/core/models/models.dart';
import 'package:global_chat/core/utils/firebase_codes.dart';

class ErrorUtils {
  const ErrorUtils._();

  static PLMError generateError(Failure failure) {
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
