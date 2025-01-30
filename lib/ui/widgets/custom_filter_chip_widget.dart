import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomFilterChipWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final void Function(bool)? onSelected;

  const CustomFilterChipWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: Icon(
        icon,
        color: selected ? AppColors.white : AppColors.bodyText2,
      ),
      label: Text(
        label,
        style: AppTextStyles.titleSmall.copyWith(
          height: 1.4,
          color: selected ? AppColors.white : AppColors.bodyText2,
        ),
      ),
      onSelected: onSelected,
      selected: selected,
    );
  }
}
