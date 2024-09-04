import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sip_smart/ui/member/edit_profile_screen.dart';

class MemberProfileScreen extends StatelessWidget {
  const MemberProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for the profile
    const String profilePictureUrl =
        "https://via.placeholder.com/150"; // Replace with actual profile picture URL
    const String fullName = "John Doe";
    const String email = "john.doe@example.com";
    final List<Map<String, String>> associations = [
      {"name": "Alpha Beta Gamma", "role": "Treasurer"},
      {"name": "Delta Sigma Theta", "role": "Member"},
      {"name": "Zeta Phi Beta", "role": "Secretary"}
    ];
    const int eventsAttended = 24;
    const int achievements = 5;
    const bool isProfilePublic = true; // Mock value for profile privacy

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profileTitle),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit_profile') {
                // Navigate to Edit Profile screen
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditProfileScreen(),
                  ),
                );
              } else if (value == 'change_password') {
                // Navigate to Change Password
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'edit_profile',
                  child: Text(AppLocalizations.of(context)!.editProfile),
                ),
                PopupMenuItem(
                  value: 'change_password',
                  child: Text(AppLocalizations.of(context)!.updatePassword),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(profilePictureUrl),
            ),
            const SizedBox(height: 16),

            // User's Name and Email
            Text(
              fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // Profile Visibility
            ListTile(
              leading: const Icon(Icons.visibility),
              title: Text(AppLocalizations.of(context)!.profileTitle),
              subtitle: Text(
                isProfilePublic
                    ? AppLocalizations.of(context)!.profilePublic
                    : AppLocalizations.of(context)!.profilePrivate,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

            const SizedBox(height: 16),

            // Event and Achievement Stats
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.event, color: Colors.blue, size: 30),
                        const SizedBox(height: 8),
                        Text(
                          eventsAttended.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text('Events Attended'),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 30),
                        const SizedBox(height: 8),
                        Text(
                          achievements.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text('Achievements'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Association and Role (List of associations)
            ...associations.map((association) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.group, color: Colors.blue),
                  title: Text(
                    association["name"]!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    "Role: ${association["role"]}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
