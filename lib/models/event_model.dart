import 'package:equatable/equatable.dart';
import 'package:sip_smart/core/constants/enums/enums.dart';

class Event extends Equatable {
  final String id;
  final String associationId; // The association hosting the event
  final String name; // Name of the event
  final String location; // Event location
  final DateTime date; // Event date
  final String description; // Description of the event
  final String createdBy; // Member who created the event
  final EventType eventType; // Updated to use EventType enum
  final bool isRecurring; // Whether the event recurs (e.g., weekly meetup)
  final DateTime createdAt; // When the event was created

  const Event({
    required this.id,
    required this.associationId,
    required this.name,
    required this.location,
    required this.date,
    required this.description,
    required this.createdBy,
    required this.eventType, // Updated here
    required this.isRecurring,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        associationId,
        name,
        location,
        date,
        description,
        createdBy,
        eventType,
        isRecurring,
        createdAt
      ];

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      associationId: json['association_id'],
      name: json['name'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      description: json['description'],
      createdBy: json['created_by'],
      eventType:
          EventType.values[json['event_type']], // Deserialize to EventType enum
      isRecurring: json['is_recurring'] == 1, // Convert int to boolean
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'association_id': associationId,
      'name': name,
      'location': location,
      'date': date.toIso8601String(),
      'description': description,
      'created_by': createdBy,
      'event_type': eventType.index, // Serialize enum to int
      'is_recurring': isRecurring ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
