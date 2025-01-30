import 'package:flutter/material.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  final Widget? leading;
  final String title;
  final Widget? trailing;
  final List<Widget> children;

  const CustomExpansionTileWidget({
    super.key,
    this.leading,
    required this.title,
    this.trailing,
    required this.children,
  });

  @override
  State<CustomExpansionTileWidget> createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> turns;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: .75,
      upperBound: 1,
    );
    turns = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ExpansionTile(
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: EdgeInsets.only(left: 16),
      shape: Border(),
      collapsedShape: Border(),
      visualDensity: VisualDensity.compact,
      showTrailingIcon: widget.trailing != null ? true : false,
      tilePadding: EdgeInsets.zero,
      title: Text(
        widget.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: textTheme.bodySmall?.copyWith(height: 1.5),
      ),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: widget.children.isNotEmpty,
            replacement: SizedBox.square(dimension: 24),
            child: RotationTransition(
              turns: turns,
              child: Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ),
          if (widget.leading != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox.square(
                dimension: 24,
                child: widget.leading!,
              ),
            )
        ],
      ),
      trailing: widget.trailing,
      onExpansionChanged: onExpansionChanged,
      enabled: widget.children.isNotEmpty,
      children: widget.children,
    );
  }

  void onExpansionChanged(bool value) {
    if (value) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }
}
