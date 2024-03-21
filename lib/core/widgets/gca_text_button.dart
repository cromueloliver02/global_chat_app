import 'package:flutter/material.dart';

class GCATextButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final Icon? icon;
  final MainAxisSize mainAxisSize;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const GCATextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
    this.icon,
    this.mainAxisSize = MainAxisSize.min,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return TextButton.icon(
        label: Text(label),
        icon: icon!,
        style: TextButton.styleFrom(
          minimumSize: mainAxisSize == MainAxisSize.min
              ? const Size(double.minPositive, 50)
              : const Size.fromHeight(50),
        ),
        onPressed: enabled ? onPressed : null,
      );
    }

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: mainAxisSize == MainAxisSize.min
            ? const Size(double.minPositive, 50)
            : const Size.fromHeight(50),
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(label),
    );
  }
}
