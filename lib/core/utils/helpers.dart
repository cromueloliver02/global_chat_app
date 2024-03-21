import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';

import 'package:global_chat/core/widgets/widgets.dart';

void showErrorDialog(
  BuildContext ctx, {
  required String title,
  required String message,
  Failure? failure,
}) {
  showCupertinoDialog<bool>(
    context: ctx,
    builder: (ctx) => GCAErrorDialog(
      title: title,
      message: message,
      failure: failure,
    ),
  );
}
