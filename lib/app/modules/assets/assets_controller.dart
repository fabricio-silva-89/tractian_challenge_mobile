import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../../../core/exceptions/custom_exception.dart';
import '../../../models/model.dart';
import '../../../repositories/repositories.dart';

class FilterState {
  final String filter;
  final bool critical;
  final bool energySensor;

  FilterState({
    required this.filter,
    required this.critical,
    required this.energySensor,
  });

  FilterState copyWith({
    String? filter,
    bool? critical,
    bool? energySensor,
  }) {
    return FilterState(
      filter: filter ?? this.filter,
      critical: critical ?? this.critical,
      energySensor: energySensor ?? this.energySensor,
    );
  }

  factory FilterState.initial() {
    return FilterState(
      filter: '',
      critical: false,
      energySensor: false,
    );
  }
}

class AssetsController extends GetxController {
  final CompaniesRepository _companiesRepository;

  AssetsController({
    required CompaniesRepository companiesRepository,
  }) : _companiesRepository = companiesRepository;

  late String _companyId;

  final _nodes = <NodeModel>[];

  final _debourcer = Debouncer(delay: 300.milliseconds);

  final _nodesMap = Rx<Map<String, List<NodeModel>>>({});
  Map<String, List<NodeModel>> get nodesMap => _nodesMap.value;

  final _filterState = Rx<FilterState>(FilterState.initial());
  FilterState get filterState => _filterState.value;

  final _errorMessage = Rx<String?>(null);
  Rx<String?> get errorMessage => _errorMessage;

  @override
  Future<void> onReady() async {
    super.onReady();
    _handleArguments();
    await _fetchNodes();
    _trasformNodesMap();
  }

  @override
  void onClose() {
    _debourcer.cancel();
    super.onClose();
  }

  void _handleArguments() {
    _companyId = Get.arguments['companyId'];
  }

  void _trasformNodesMap() {
    for (var node in _nodes) {
      String parentId = node.parentId ?? node.locationId ?? 'root';
      _nodesMap.value[parentId] ??= [];
      _nodesMap.value[parentId]!.add(node);
    }
    _nodesMap.refresh();
  }

  Future<void> _fetchNodes() async {
    try {
      final result = await Future.wait([
        _companiesRepository.getLocationsByCompany(companyId: _companyId),
        _companiesRepository.getAssetsByCompany(companyId: _companyId),
      ]);

      final locations = result[0];
      final assets = result[1];
      _nodes.addAll([...locations, ...assets]);
    } on CustomException catch (e) {
      _errorMessage.value = e.message;
    }
  }

  void onChangedInput(String value) {
    _debourcer.cancel();
    _debourcer.call(() {
      _filterState.value =
          _filterState.value.copyWith(filter: value.toLowerCase());
      _filterState.refresh();
    });
  }

  void onChangedEnergySensor(bool value) {
    _filterState.value = _filterState.value.copyWith(
      critical: value ? false : null,
      energySensor: value,
    );
    _filterState.refresh();
  }

  void onChangedCritical(bool value) {
    _filterState.value = _filterState.value.copyWith(
      critical: value,
      energySensor: value ? false : null,
    );
    _filterState.refresh();
  }
}
