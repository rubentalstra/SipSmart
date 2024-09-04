import 'package:equatable/equatable.dart';
import 'package:sip_smart/core/constants/enums/enums.dart';

class DrinkLog extends Equatable {
  final int id;
  final String associationId;
  final String memberId;
  final int drinkCount;
  final DrinkType drinkType; // Updated to use the DrinkType enum
  final DateTime timestamp;
  final String? eventId; // Event associated with this log (nullable)
  final String? notes; // Optional notes (nullable)
  final bool isSynced; // Whether the log has been synced to the server

  const DrinkLog({
    required this.id,
    required this.associationId,
    required this.memberId,
    required this.drinkCount,
    required this.drinkType,
    required this.timestamp,
    this.eventId,
    this.notes,
    required this.isSynced,
  });

  @override
  List<Object?> get props => [
        id,
        associationId,
        memberId,
        drinkCount,
        drinkType,
        timestamp,
        eventId,
        notes,
        isSynced
      ];

  factory DrinkLog.fromJson(Map<String, dynamic> json) {
    return DrinkLog(
      id: json['id'],
      associationId: json['association_id'],
      memberId: json['member_id'],
      drinkCount: json['drink_count'],
      drinkType:
          DrinkType.values[json['drink_type']], // Deserialize to DrinkType enum
      timestamp: DateTime.parse(json['timestamp']),
      eventId: json['event_id'],
      notes: json['notes'],
      isSynced: json['is_synced'] == 1, // Convert int to boolean
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'association_id': associationId,
      'member_id': memberId,
      'drink_count': drinkCount,
      'drink_type': drinkType.index, // Serialize enum to int
      'timestamp': timestamp.toIso8601String(),
      'event_id': eventId,
      'notes': notes,
      'is_synced': isSynced ? 1 : 0,
    };
  }
}
