import 'package:core_utils/core_utils.dart';

import 'package:global_chat/core/error_infos/error_info.dart';
import 'package:global_chat/core/models/models.dart';

class UnexpectedErrorInfo implements ErrorInfo {
  final UnexpectedFailure failure;

  const UnexpectedErrorInfo(this.failure);

  @override
  ErrorDetails generateError() {
    return ErrorDetails(
      title: UnexpectedFailure.title,
      message: failure.exception.message,
      failure: failure,
    );
  }
}
