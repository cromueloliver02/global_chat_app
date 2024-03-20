import 'package:global_chat/core/error/error_infos/error_info.dart';
import 'package:global_chat/core/error/failures/failure.dart';
import 'package:global_chat/core/models/models.dart';

class NetworkErrorInfo implements ErrorInfo {
  final NetworkFailure failure;

  const NetworkErrorInfo(this.failure);

  @override
  PLMError generateError() {
    return PLMError(
      title: NetworkFailure.title,
      message: failure.exception.message,
      failure: failure,
    );
  }
}
