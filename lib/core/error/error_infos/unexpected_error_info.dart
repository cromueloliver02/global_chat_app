import 'package:global_chat/core/error/error_infos/error_info.dart';
import 'package:global_chat/core/error/failures/failure.dart';
import 'package:global_chat/core/models/models.dart';

class UnexpectedErrorInfo implements ErrorInfo {
  final UnexpectedFailure failure;

  const UnexpectedErrorInfo(this.failure);

  @override
  PLMError generateError() {
    return PLMError(
      title: UnexpectedFailure.title,
      message: failure.exception.message,
      failure: failure,
    );
  }
}
