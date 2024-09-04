enum EventType {
  party,
  meeting,
  social,
  fundraiser,
  sports,
  other,
}

extension EventTypeExtension on EventType {
  String get name {
    switch (this) {
      case EventType.party:
        return "Party";
      case EventType.meeting:
        return "Meeting";
      case EventType.social:
        return "Social";
      case EventType.fundraiser:
        return "Fundraiser";
      case EventType.sports:
        return "Sports";
      case EventType.other:
        return "Other";
    }
  }
}
