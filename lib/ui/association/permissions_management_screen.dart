import 'package:flutter/material.dart';
import 'package:sip_smart/core/constants/enums/enums.dart';

class PermissionsManagementScreen extends StatefulWidget {
  const PermissionsManagementScreen({super.key});

  @override
  _PermissionsManagementScreenState createState() =>
      _PermissionsManagementScreenState();
}

class _PermissionsManagementScreenState
    extends State<PermissionsManagementScreen> {
  // Mock data for permissions
  Map<String, List<PermissionType>> membersPermissions = {};

  @override
  void initState() {
    super.initState();
    _loadPermissions();
  }

  void _loadPermissions() {
    // Simulate fetching data
    setState(() {
      membersPermissions = {
        "John Doe": [
          PermissionType.assignDrinkDebt,
          PermissionType.viewDrinkDebtLog
        ],
        "Jane Smith": [PermissionType.createAchievements],
        "Sarah Johnson": [PermissionType.removeDrinkDebt],
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Permissions'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: membersPermissions.keys.length,
        itemBuilder: (context, index) {
          final String memberName = membersPermissions.keys.elementAt(index);
          final List<PermissionType> permissions =
              membersPermissions[memberName]!;

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(memberName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: permissions
                    .map((permission) => Text(permission.name))
                    .toList(),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Logic to edit permissions
                },
                child: const Text('Edit Permissions'),
              ),
            ),
          );
        },
      ),
    );
  }
}
