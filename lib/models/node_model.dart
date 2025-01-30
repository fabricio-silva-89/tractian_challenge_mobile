import 'dart:convert';

import 'model.dart';

class NodeModel extends BaseModel {
  final String? locationId;
  final String name;
  final String? gatewayId;
  final String? parentId;
  final String? sensorId;
  final SensorTypeEnum sensorType;
  final StatusEnum status;

  NodeModel({
    required super.id,
    this.locationId,
    required this.name,
    this.gatewayId,
    this.parentId,
    this.sensorId,
    required this.sensorType,
    required this.status,
  });

  factory NodeModel.fromMap(Map<String, dynamic> map) {
    return NodeModel(
      id: map['id'] as String,
      locationId:
          map['locationId'] != null ? map['locationId'] as String : null,
      name: map['name'] as String,
      gatewayId: map['gatewayId'] != null ? map['gatewayId'] as String : null,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      sensorId: map['sensorId'] != null ? map['sensorId'] as String : null,
      sensorType: SensorTypeEnum.of(map['sensorType'] ?? ''),
      status: StatusEnum.of(map['status'] ?? ''),
    );
  }

  factory NodeModel.fromJson(String source) {
    return NodeModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }
}

enum StatusEnum {
  alert('alert'),
  operating('operating'),
  none('');

  final String key;

  const StatusEnum(this.key);

  factory StatusEnum.of(String key) {
    return StatusEnum.values
        .firstWhere((element) => element.key == key, orElse: () => none);
  }
}

enum SensorTypeEnum {
  vibration('vibration'),
  energy('energy'),
  none('');

  final String key;

  const SensorTypeEnum(this.key);

  factory SensorTypeEnum.of(String key) {
    return SensorTypeEnum.values
        .firstWhere((element) => element.key == key, orElse: () => none);
  }
}
