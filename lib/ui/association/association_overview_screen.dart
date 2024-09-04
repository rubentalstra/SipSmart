import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'member_list_screen.dart';
import 'permissions_management_screen.dart';

class AssociationOverviewScreen extends StatelessWidget {
  final int id;
  final String associationName;
  final String description;

  const AssociationOverviewScreen({
    required this.id,
    required this.associationName,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(associationName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Association Details
            Text(
              associationName,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // Members List Button
            ElevatedButton.icon(
              icon: const Icon(Icons.group),
              label: Text(AppLocalizations.of(context)!.associationTitle),
              onPressed: () {
                // Navigate to Member List Screen with association data
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MemberListScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Permissions Management (Admin Only)
            ElevatedButton.icon(
              icon: const Icon(Icons.admin_panel_settings),
              label: const Text('Permissions Management'),
              onPressed: () {
                // Navigate to Permissions Management Screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PermissionsManagementScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
