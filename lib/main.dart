import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sip_smart/bloc/locale/locale_bloc.dart';
import 'package:sip_smart/bloc/locale/locale_state.dart';
import 'package:sip_smart/bloc/theme/theme_bloc.dart';
import 'package:sip_smart/bloc/theme/theme_state.dart';
import 'package:sip_smart/core/themes/themes.dart';
import 'package:sip_smart/ui/association/association_screen.dart';
import 'package:sip_smart/ui/home/home_screen.dart';
import 'package:sip_smart/ui/member/member_profile_screen.dart';
import 'package:sip_smart/ui/settings/settings_screen.dart';
import 'package:sip_smart/ui/widgets/bottom_nav_bar.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider<LocaleBloc>(
          create: (_) => LocaleBloc(),
        ),
      ],
      child: const SipSmartApp(),
    ),
  );
}

class SipSmartApp extends StatelessWidget {
  const SipSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp(
              title: 'SipSmart',
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: themeState.themeMode,
              locale: localeState.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              home: const MainScreen(),
            );
          },
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens corresponding to the bottom navigation items
  final List<Widget> _screens = [
    const HomeScreen(),
    const AssociationScreen(),
    const MemberProfileScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
