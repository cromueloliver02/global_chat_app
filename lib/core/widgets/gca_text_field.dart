import 'package:flutter/material.dart';

import 'package:global_chat/theme/app_theme.dart';

class GCATextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? enabled;
  final bool enableFeedback;
  final AutovalidateMode? autovalidateMode;
  final bool? filled;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final bool readOnly;
  final Color? fillColor;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final double borderRadius;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  const GCATextField({
    super.key,
    this.controller,
    this.enabled,
    this.enableFeedback = true,
    this.autovalidateMode,
    this.filled,
    this.hintText,
    this.hintStyle,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.obscureText = false,
    this.readOnly = false,
    this.fillColor,
    this.suffixIcon,
    this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.borderRadius = 90,
    this.validator,
    this.onSaved,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      autovalidateMode: autovalidateMode,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        // pre-occupied space for error text
        counterText: enableFeedback
            ? maxLength == null
                ? ' '
                : null
            : null,
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        hintStyle: hintStyle ??
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: context.theme.primaryColor),
        ),
      ),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
