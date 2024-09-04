import 'package:equatable/equatable.dart';
import 'package:sip_smart/core/constants/enums/enums.dart';
import 'package:sip_smart/models/role_model.dart';

class Member extends Equatable {
  final String id;
  final String name;
  final String email;
  final String associationId;
  final List<Role> roles; // List of custom roles assigned to the member
  final String profilePictureUrl;
  final DateTime createdAt;

  const Member({
    required this.id,
    required this.name,
    required this.email,
    required this.associationId,
    required this.roles,
    required this.profilePictureUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [id, name, email, associationId, roles, profilePictureUrl, createdAt];

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      associationId: json['association_id'],
      roles: (json['roles'] as List)
          .map((roleJson) => Role.fromJson(roleJson))
          .toList(), // Deserialize list of roles
      profilePictureUrl: json['profile_picture_url'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Utility function to check if a member has a certain permission
  bool hasPermission(PermissionType permission) {
    for (final role in roles) {
      if (role.permissions.contains(permission)) {
        return true;
      }
    }
    return false;
  }
}
