import 'package:flutter/material.dart';

class GCAErrorCard extends StatelessWidget {
  final String message;

  const GCAErrorCard({
    super.key,
    this.message = 'Something went wrong',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error, color: Colors.grey.shade600, size: 30),
          const SizedBox(height: 20),
          Text(message),
        ],
      ),
    );
  }
}
