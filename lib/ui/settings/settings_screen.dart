import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sip_smart/bloc/locale/locale_bloc.dart';
import 'package:sip_smart/bloc/locale/locale_event.dart';
import 'package:sip_smart/bloc/locale/locale_state.dart';
import 'package:sip_smart/bloc/theme/theme_bloc.dart';
import 'package:sip_smart/bloc/theme/theme_event.dart';
import 'package:sip_smart/bloc/theme/theme_state.dart';

import 'widgets/settings_section.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _appVersion = '';
  String _buildNumber = '';

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  // Load the app version and build number using package_info_plus
  Future<void> _loadAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
      _buildNumber = packageInfo.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Save settings
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Theme Section
          SettingsSection(
            title: AppLocalizations.of(context)!.themePreference,
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return DropdownButton<ThemeMode>(
                  value: state.themeMode,
                  onChanged: (ThemeMode? newTheme) {
                    if (newTheme != null) {
                      BlocProvider.of<ThemeBloc>(context).add(
                        ThemeChanged(themeMode: newTheme),
                      );
                    }
                  },
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text(AppLocalizations.of(context)!.systemTheme),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text(AppLocalizations.of(context)!.lightTheme),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text(AppLocalizations.of(context)!.darkTheme),
                    ),
                  ],
                );
              },
            ),
          ),

          // Language Section
          SettingsSection(
            title: AppLocalizations.of(context)!.languagePreference,
            child: BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, state) {
                return DropdownButton<Locale>(
                  value: state.locale,
                  onChanged: (Locale? newLocale) {
                    if (newLocale != null) {
                      BlocProvider.of<LocaleBloc>(context).add(
                        LocaleChanged(locale: newLocale),
                      );
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: Locale('nl'),
                      child: Text('Dutch'),
                    ),
                    // Add more languages as needed
                  ],
                );
              },
            ),
          ),

          // Notifications Section
          SettingsSection(
            title: AppLocalizations.of(context)!.notificationsTitle,
            child: SwitchListTile(
              title: Text(AppLocalizations.of(context)!.enableNotifications),
              value: true, // Replace with actual state
              onChanged: (bool value) {
                // Implement notification toggle logic
              },
            ),
          ),

          // App Version and Build Number Section
          SettingsSection(
            title: AppLocalizations.of(context)!.appVersion,
            child: ListTile(
              title: Text('$_appVersion ($_buildNumber)'),
            ),
          ),
        ],
      ),
    );
  }
}
