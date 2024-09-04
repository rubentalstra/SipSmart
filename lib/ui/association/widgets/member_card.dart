import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String profilePicture;
  final VoidCallback onTap;

  const MemberCard({
    required this.name,
    required this.role,
    required this.profilePicture,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(profilePicture)),
        title: Text(name),
        subtitle: Text(role),
        onTap: onTap,
      ),
    );
  }
}
