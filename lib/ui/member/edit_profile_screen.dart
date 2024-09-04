import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isProfilePublic = true; // Mock value for profile privacy
  final TextEditingController fullNameController =
      TextEditingController(text: "John Doe");
  final TextEditingController emailController =
      TextEditingController(text: "john.doe@example.com");

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editProfile),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save profile changes here
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Full Name Input
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.accountDetails,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Email Input
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.updateEmail,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Profile Visibility Toggle
            SwitchListTile(
              title: Text(AppLocalizations.of(context)!.profileTitle),
              subtitle: Text(
                isProfilePublic
                    ? AppLocalizations.of(context)!.profilePublic
                    : AppLocalizations.of(context)!.profilePrivate,
              ),
              value: isProfilePublic,
              onChanged: (bool value) {
                setState(() {
                  isProfilePublic = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
