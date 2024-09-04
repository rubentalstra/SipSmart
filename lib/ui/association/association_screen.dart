import 'package:flutter/material.dart';
import 'package:sip_smart/ui/association/widgets/association_card.dart';
import 'association_overview_screen.dart';

class AssociationScreen extends StatefulWidget {
  const AssociationScreen({super.key});

  @override
  _AssociationScreenState createState() => _AssociationScreenState();
}

class _AssociationScreenState extends State<AssociationScreen> {
  // Mock data for the list of associations with logos
  List<Map<String, dynamic>> associations = [
    {
      'id': 0,
      "name": "Alpha Beta Gamma",
      "logoUrl": "https://via.placeholder.com/150"
    },
    {
      'id': 1,
      "name": "Delta Sigma Theta",
      "logoUrl": "https://via.placeholder.com/150"
    },
    {
      'id': 2,
      "name": "Zeta Phi Beta",
      "logoUrl": "https://via.placeholder.com/150"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Associations"),
      ),
      body: associations.isEmpty
          ? const Center(child: Text("No associations found."))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Display two cards in each row
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.8, // Aspect ratio to make it taller
                ),
                itemCount: associations.length,
                itemBuilder: (context, index) {
                  final association = associations[index];
                  return AssociationCard(
                    name: association["name"]!,
                    logoUrl: association["logoUrl"]!,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AssociationOverviewScreen(
                            id: association["id"]!,
                            associationName: association["name"]!,
                            description:
                                "Description for ${association["name"]}",
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open dialog to enter invite code
          _showInviteCodeDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Dialog to add an association using an invite code
  void _showInviteCodeDialog(BuildContext context) {
    final TextEditingController _inviteCodeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Association"),
          content: TextField(
            controller: _inviteCodeController,
            decoration: InputDecoration(
              hintText: "Enter invite code",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without action
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String inviteCode = _inviteCodeController.text.trim();
                if (inviteCode.isNotEmpty) {
                  _addAssociation(inviteCode);
                }
                Navigator.of(context).pop(); // Close the dialog after adding
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // Function to add an association using the invite code
  void _addAssociation(String inviteCode) {
    setState(() {
      // Mock adding association based on invite code
      associations.add({
        "name": "New Association $inviteCode",
        "description": "A new association added with code $inviteCode",
      });
    });
  }
}
