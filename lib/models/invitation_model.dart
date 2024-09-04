import 'package:equatable/equatable.dart';

class Invitation extends Equatable {
  final String id; // Unique ID for the invitation
  final String associationId; // Association the invite is for
  final String invitedBy; // Member who sent the invitation
  final String inviteeEmail; // Email of the person invited
  final DateTime sentAt; // When the invitation was sent
  final DateTime? acceptedAt; // When the invitation was accepted (nullable)
  final bool isAccepted; // Whether the invitation was accepted

  const Invitation({
    required this.id,
    required this.associationId,
    required this.invitedBy,
    required this.inviteeEmail,
    required this.sentAt,
    this.acceptedAt,
    required this.isAccepted,
  });

  @override
  List<Object?> get props => [
        id,
        associationId,
        invitedBy,
        inviteeEmail,
        sentAt,
        acceptedAt,
        isAccepted
      ];

  factory Invitation.fromJson(Map<String, dynamic> json) {
    return Invitation(
      id: json['id'],
      associationId: json['association_id'],
      invitedBy: json['invited_by'],
      inviteeEmail: json['invitee_email'],
      sentAt: DateTime.parse(json['sent_at']),
      acceptedAt: json['accepted_at'] != null
          ? DateTime.parse(json['accepted_at'])
          : null,
      isAccepted: json['is_accepted'] == 1, // Convert int to boolean
    );
  }
}
