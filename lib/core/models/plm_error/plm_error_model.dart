import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:global_chat/core/error/failures/failure.dart';

part 'plm_error_model.freezed.dart';

@freezed
class PLMError with _$PLMError {
  factory PLMError({
    required String title,
    required String message,
    required Failure failure,
  }) = _PLMError;
}
