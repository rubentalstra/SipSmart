import 'package:equatable/equatable.dart';
import 'package:sip_smart/core/constants/enums/enums.dart';

class Role extends Equatable {
  final String id; // Unique ID for the role
  final String associationId; // Association to which this role belongs
  final String name; // Name of the role (e.g., President, Event Manager)
  final List<PermissionType>
      permissions; // Updated to use List of PermissionType enum

  const Role({
    required this.id,
    required this.associationId,
    required this.name,
    required this.permissions,
  });

  @override
  List<Object?> get props => [id, associationId, name, permissions];

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      associationId: json['association_id'],
      name: json['name'],
      permissions: (json['permissions'] as List)
          .map((permission) => PermissionType
              .values[permission]) // Deserialize to List of PermissionType enum
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'association_id': associationId,
      'name': name,
      'permissions': permissions
          .map((permission) => permission.index)
          .toList(), // Serialize List of enums to List of int
    };
  }
}
