import 'package:flutter/material.dart';

class GCALoadingCard extends StatelessWidget {
  const GCALoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('LOADING'),
        ],
      ),
    );
  }
}
