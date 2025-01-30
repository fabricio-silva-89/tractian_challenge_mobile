import 'package:flutter/material.dart';

import '../theme/theme.dart';

class FilterItemWidget extends StatelessWidget {
  final Widget icon;
  final String label;

  const FilterItemWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Row(
        spacing: 6,
        children: [
          icon,
          Text(label),
        ],
      ),
    );
  }
}
