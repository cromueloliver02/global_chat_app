import 'package:flutter/material.dart';

class GCARoundedButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final Icon? icon;
  final MainAxisSize mainAxisSize;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const GCARoundedButton({
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
      return ElevatedButton.icon(
        label: Text(label),
        icon: icon!,
        style: ElevatedButton.styleFrom(
          minimumSize: mainAxisSize == MainAxisSize.min
              ? const Size(double.minPositive, 50)
              : const Size.fromHeight(50),
          foregroundColor: foregroundColor ?? Colors.white,
          backgroundColor: backgroundColor ?? Colors.deepPurple,
        ),
        onPressed: enabled ? onPressed : null,
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: mainAxisSize == MainAxisSize.min
            ? const Size(double.minPositive, 50)
            : const Size.fromHeight(50),
        foregroundColor: foregroundColor ?? Colors.white,
        backgroundColor: backgroundColor ?? Colors.deepPurple,
      ),
      onPressed: enabled ? onPressed : null,
      child: Text(label),
    );
  }
}
