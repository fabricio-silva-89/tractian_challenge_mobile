import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CompanyButtonWidget extends StatelessWidget {
  final String companyName;
  final void Function()? onPressed;

  const CompanyButtonWidget({
    super.key,
    required this.companyName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FilledButton.icon(
      onPressed: onPressed,
      icon: Image.asset(AppImages.company),
      label: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(companyName),
      ),
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        iconSize: 24,
        alignment: Alignment.centerLeft,
        textStyle: textTheme.titleLarge?.copyWith(height: 1.5),
      ),
    );
  }
}
