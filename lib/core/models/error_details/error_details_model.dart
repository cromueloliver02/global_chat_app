import 'package:core_utils/core_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_details_model.freezed.dart';

@freezed
class ErrorDetails with _$ErrorDetails {
  factory ErrorDetails({
    required String title,
    required String message,
    required Failure failure,
  }) = _ErrorDetails;
}
