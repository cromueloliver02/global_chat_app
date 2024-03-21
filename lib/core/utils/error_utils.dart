import 'package:core_utils/core_utils.dart';

import 'package:global_chat/core/error_infos/error_infos.dart';
import 'package:global_chat/core/models/models.dart';

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
}
