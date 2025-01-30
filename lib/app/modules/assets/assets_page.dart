import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/model.dart';
import '../../../ui/helpers/helpers.dart';
import '../../../ui/theme/theme.dart';
import '../../../ui/widgets/widgets.dart';
import './assets_controller.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> with UIMessageMixin {
  final controller = Get.find<AssetsController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ever(controller.errorMessage, (error) {
        if (error != null) showError(context, error);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assets'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            InputTextWidget(
              hintText: 'Buscar Ativo ou Local',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.sentences,
              onChanged: controller.onChangedInput,
            ),
            Obx(() {
              return Wrap(
                spacing: 8,
                children: [
                  CustomFilterChipWidget(
                    label: 'Sensor de Energia',
                    icon: Icons.bolt,
                    selected: controller.filterState.energySensor,
                    onSelected: controller.onChangedEnergySensor,
                  ),
                  CustomFilterChipWidget(
                    label: 'Crítico',
                    icon: Icons.error_outline_rounded,
                    selected: controller.filterState.critical,
                    onSelected: controller.onChangedCritical,
                  ),
                ],
              );
            }),
            Expanded(
              child: LayoutBuilder(
                builder: (_, constrains) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constrains.maxHeight,
                    ),
                    child: Obx(() {
                      if (controller.nodesMap.isEmpty) return LoadingWidget();
                      return ListView(
                        shrinkWrap: true,
                        cacheExtent: 0,
                        children: _buildNodes(
                          'root',
                          controller.nodesMap,
                          controller.filterState,
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNodes(
    String parentId,
    Map<String, List<NodeModel>> nodesMap,
    FilterState filter,
  ) {
    List<Widget> children = [];

    if (nodesMap.containsKey(parentId)) {
      for (var node in nodesMap[parentId]!) {
        if (_shouldIncludeNode(node, nodesMap, filter)) {
          final widget = CustomExpansionTileWidget(
            title: node.name,
            leading: _getLeading(node),
            trailing: _getTrailing(node),
            children: _buildNodes(node.id, nodesMap, filter),
          );
          children.add(widget);
        }
      }
    }

    return children;
  }

  Image _getLeading(NodeModel node) {
    return node.sensorType != SensorTypeEnum.none &&
            node.status != StatusEnum.none
        ? Image.asset(AppImages.component)
        : node.locationId != null
            ? Image.asset(AppImages.asset)
            : Image.asset(AppImages.location);
  }

  StatelessWidget? _getTrailing(NodeModel node) {
    return node.status == StatusEnum.alert
        ? Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: AppColors.negative,
              shape: BoxShape.circle,
            ),
          )
        : node.sensorType == SensorTypeEnum.energy
            ? Icon(Icons.bolt, color: AppColors.positive)
            : null;
  }

  bool _shouldIncludeNode(
    NodeModel node,
    Map<String, List<NodeModel>> nodeMap,
    FilterState filter,
  ) {
    bool matchesFilter = filter.filter.isEmpty ||
        node.name.toLowerCase().contains(filter.filter);
    bool matchesEnergy = !filter.energySensor ||
        (filter.energySensor && node.sensorType == SensorTypeEnum.energy);
    bool matchesCritical = !filter.critical ||
        (filter.critical && node.status == StatusEnum.alert);
    bool hasVisibleChildren = _hasVisibleChildren(node.id, nodeMap, filter);
    return (matchesFilter && matchesEnergy && matchesCritical) ||
        hasVisibleChildren;
  }

  bool _hasVisibleChildren(
    String parentId,
    Map<String, List<NodeModel>> nodeMap,
    FilterState filter,
  ) {
    if (!nodeMap.containsKey(parentId)) return false;
    for (var child in nodeMap[parentId]!) {
      if (_shouldIncludeNode(child, nodeMap, filter)) return true;
    }
    return false;
  }
}

// class CustomFilterChipWidget extends StatelessWidget {
//   final String label;
//   final bool selected;
//   final void Function(bool)? onSelected;

//   const CustomFilterChipWidget({
//     super.key,
//     required this.label,
//     required this.selected,
//     this.onSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FilterChip(
//       avatar: Icon(
//         Icons.bolt,
//         color: selected ? AppColors.white : AppColors.bodyText2,
//       ),
//       label: Text(
//         'Sensor de Energia',
//         style: AppTextStyles.titleSmall.copyWith(
//           height: 1.4,
//           color: selected ? AppColors.white : AppColors.bodyText2,
//         ),
//       ),
//       onSelected: onSelected,
//       selected: selected,
//     );
//   }
// }
