import 'package:flutter/material.dart';
import 'package:sip_smart/ui/association/member_profile_screen.dart';
import 'package:sip_smart/ui/association/widgets/member_card.dart';

class MemberListScreen extends StatelessWidget {
  const MemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> members = [
      {
        "name": "John Doe",
        "role": "Treasurer",
        "profilePicture": "https://via.placeholder.com/150"
      },
      {
        "name": "Jane Smith",
        "role": "Member",
        "profilePicture": "https://via.placeholder.com/150"
      },
      {
        "name": "Sarah Johnson",
        "role": "Secretary",
        "profilePicture": "https://via.placeholder.com/150"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Members'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: members.length,
        itemBuilder: (context, index) {
          return MemberCard(
            name: members[index]["name"]!,
            role: members[index]["role"]!,
            profilePicture: members[index]["profilePicture"]!,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MemberProfileScreen(
                    memberName: members[index]["name"]!,
                    role: members[index]["role"]!,
                    drinkHistory: const [], // Example placeholder, add actual history data
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
