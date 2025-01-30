import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget? trailing;

  const CustomListTileWidget({
    super.key,
    this.leading,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(title, style: textTheme.bodySmall?.copyWith(height: 1.5)),
      leading: leading,
      trailing: trailing,
    );
  }
}
