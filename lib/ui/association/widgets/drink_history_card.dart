import 'package:flutter/material.dart';
import 'package:sip_smart/core/constants/enums/enums.dart';

class DrinkHistoryCard extends StatelessWidget {
  final Map<String, dynamic> drink;

  const DrinkHistoryCard({required this.drink, super.key});

  @override
  Widget build(BuildContext context) {
    final DrinkType drinkType = drink['drinkType'];
    final int amount = drink['amount'];
    final EventType eventType = drink['eventType'];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          _getDrinkIcon(drinkType),
          color: _getDrinkIconColor(drinkType),
        ),
        title: Text("${drinkType.name}: $amount drinks"),
        subtitle: Text("Event: ${eventType.name}"),
      ),
    );
  }

  IconData _getDrinkIcon(DrinkType drinkType) {
    switch (drinkType) {
      case DrinkType.beer:
        return Icons.local_drink;
      case DrinkType.wine:
        return Icons.wine_bar;
      case DrinkType.nonAlcoholic:
        return Icons.no_drinks;
      case DrinkType.cocktail:
        return Icons.local_cafe;
      case DrinkType.spirits:
        return Icons.liquor;
      case DrinkType.other:
        return Icons.coffee;
    }
  }

  Color _getDrinkIconColor(DrinkType drinkType) {
    switch (drinkType) {
      case DrinkType.beer:
        return Colors.amber;
      case DrinkType.wine:
        return Colors.purple;
      case DrinkType.nonAlcoholic:
        return Colors.green;
      case DrinkType.cocktail:
        return Colors.blue;
      case DrinkType.spirits:
        return Colors.red;
      case DrinkType.other:
        return Colors.grey;
    }
  }
}
