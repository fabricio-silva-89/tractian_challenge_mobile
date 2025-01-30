import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  const InputTextWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextField(
      style: textTheme.bodySmall?.copyWith(height: 1.4),
      cursorHeight: 14,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, size: 14),
        hintText: hintText,
      ),
    );
  }
}
