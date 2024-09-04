import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sip_smart/bloc/theme/theme_bloc.dart';
import 'package:sip_smart/bloc/theme/theme_event.dart';
import 'package:sip_smart/bloc/theme/theme_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)!.settingsTitle), // Localized title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Settings Title
            Text(
              AppLocalizations.of(context)!.settingsTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),

            // Theme Switcher
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                bool isDarkTheme =
                    state.themeData.brightness == Brightness.dark;
                return SwitchListTile(
                  title: Text(AppLocalizations.of(context)!.themePreference),
                  subtitle: Text(isDarkTheme
                      ? AppLocalizations.of(context)!.darkTheme
                      : AppLocalizations.of(context)!.lightTheme),
                  value: isDarkTheme,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ToggleThemeEvent());
                  },
                );
              },
            ),

            // Other settings (language, notifications, etc.)
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.languagePreference),
              onTap: () {
                // Handle language change
              },
            ),

            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(AppLocalizations.of(context)!.manageNotifications),
              onTap: () {
                // Handle notification settings
              },
            ),
          ],
        ),
      ),
    );
  }
}
