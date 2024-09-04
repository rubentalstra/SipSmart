import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sip_smart/ui/association/widgets/drink_history_card.dart';

class MemberProfileScreen extends StatelessWidget {
  final String memberName;
  final String role;
  final List<Map<String, dynamic>> drinkHistory;

  const MemberProfileScreen({
    required this.memberName,
    required this.role,
    required this.drinkHistory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const int drinkDebt = 3;

    return Scaffold(
      appBar: AppBar(
        title: Text(memberName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Member Information
            Text(
              memberName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              role,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            // Drink Debt Information
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.monetization_on, color: Colors.red),
                title: Text(AppLocalizations.of(context)!.profileTitle),
                subtitle: Text(
                  "Drink Debt: $drinkDebt drinks",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Drink History Section
            Text(
              "Drink History",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...drinkHistory.map((drink) {
              return DrinkHistoryCard(drink: drink);
            }),
          ],
        ),
      ),
    );
  }
}
