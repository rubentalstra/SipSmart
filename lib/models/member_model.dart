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
  final bool isProfilePublic; // New field to track profile visibility

  const Member({
    required this.id,
    required this.name,
    required this.email,
    required this.associationId,
    required this.roles,
    required this.profilePictureUrl,
    required this.createdAt,
    required this.isProfilePublic, // Initialize with the new field
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        associationId,
        roles,
        profilePictureUrl,
        createdAt,
        isProfilePublic
      ];

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
      isProfilePublic:
          json['is_profile_public'], // Deserialize profile visibility
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

  // Method to serialize Member to JSON, including profile visibility
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'association_id': associationId,
      'roles': roles.map((role) => role.toJson()).toList(),
      'profile_picture_url': profilePictureUrl,
      'created_at': createdAt.toIso8601String(),
      'is_profile_public': isProfilePublic,
    };
  }
}
