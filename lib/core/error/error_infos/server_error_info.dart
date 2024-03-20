import 'package:global_chat/core/error/error_infos/error_info.dart';
import 'package:global_chat/core/error/failures/failure.dart';
import 'package:global_chat/core/models/models.dart';
import 'package:global_chat/core/utils/firebase_codes.dart';

class ServerErrorInfo implements ErrorInfo {
  final ServerFailure failure;

  const ServerErrorInfo(this.failure);

  @override
  PLMError generateError() {
    final String statusCode = failure.exception.statusCode;

    if (statusCode == FirebaseErrorCode.invalidLoginCredentials) {
      return PLMError(
        title: 'Authentication Failed',
        message: 'Incorrect email or password.',
        failure: failure,
      );
    }

    if (statusCode == FirebaseErrorCode.tooManyRequests) {
      return PLMError(
        title: 'Too Many Requests',
        message: failure.exception.message,
        failure: failure,
      );
    }

    return PLMError(
      title: ServerFailure.title,
      message: failure.exception.message,
      failure: failure,
    );
  }
}
