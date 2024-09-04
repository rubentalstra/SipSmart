import 'package:flutter/material.dart';

class AssignDebtScreen extends StatelessWidget {
  final List<String> members;

  const AssignDebtScreen({required this.members, super.key});

  @override
  Widget build(BuildContext context) {
    String selectedMember = members.first;
    int drinkDebt = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Drink Debt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedMember,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  selectedMember = newValue;
                }
              },
              decoration: const InputDecoration(labelText: 'Select Member'),
              items: members.map<DropdownMenuItem<String>>((String member) {
                return DropdownMenuItem<String>(
                  value: member,
                  child: Text(member),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButton<int>(
              value: drinkDebt,
              onChanged: (int? newValue) {
                if (newValue != null) {
                  drinkDebt = newValue;
                }
              },
              items: List.generate(10, (index) => index + 1).map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text('Assign Drink Debt'),
              onPressed: () {
                // Logic to assign debt
              },
            ),
          ],
        ),
      ),
    );
  }
}
