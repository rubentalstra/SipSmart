import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // For iOS CupertinoTabBar
import 'dart:io'; // For Platform check (iOS vs Android)
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Check platform and return the correct widget
    return Platform.isIOS
        ? CupertinoTabBar(
            currentIndex: selectedIndex,
            onTap: onTap,
            activeColor: CupertinoColors.activeBlue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.home),
                label: AppLocalizations.of(context)!.homeTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.group),
                label: AppLocalizations.of(context)!.associationTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person),
                label: AppLocalizations.of(context)!.profileTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.settings),
                label: AppLocalizations.of(context)!.settingsTitle,
              ),
            ],
          )
        : BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: onTap,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.homeTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.group),
                label: AppLocalizations.of(context)!.associationTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: AppLocalizations.of(context)!.profileTitle,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settingsTitle,
              ),
            ],
          );
  }
}
