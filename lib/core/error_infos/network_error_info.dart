import 'package:core_utils/core_utils.dart';

import 'package:global_chat/core/error_infos/error_info.dart';
import 'package:global_chat/core/models/models.dart';

class NetworkErrorInfo implements ErrorInfo {
  final NetworkFailure failure;

  const NetworkErrorInfo(this.failure);

  @override
  ErrorDetails generateError() {
    return ErrorDetails(
      title: NetworkFailure.title,
      message: failure.exception.message,
      failure: failure,
    );
  }
}
