import 'package:flutter/material.dart';

mixin UIMessageMixin {
  void showError(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  }
}
