import 'package:flutter/material.dart';

class GCAEmptyCard extends StatelessWidget {
  final String message;

  const GCAEmptyCard({
    super.key,
    this.message = 'Nothing to show here',
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
