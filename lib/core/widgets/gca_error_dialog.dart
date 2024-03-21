import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GCAErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final Failure? failure;

  const GCAErrorDialog({
    super.key,
    required this.title,
    required this.message,
    this.failure,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.black54),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text(message, textAlign: TextAlign.center)),
            if (failure != null && kDebugMode) ...[
              const SizedBox(height: 10),
              const Divider(thickness: 1, color: Colors.black12),
              const SizedBox(height: 10),
              Text(
                '$failure',
                textAlign: TextAlign.left,
              ),
            ],
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Okay'),
        ),
      ],
    );
  }
}
