import 'package:equatable/equatable.dart';

class Association extends Equatable {
  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Association({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, name, description, logoUrl, createdAt, updatedAt];

  // Optional: factory to create Association from JSON
  factory Association.fromJson(Map<String, dynamic> json) {
    return Association(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      logoUrl: json['logo_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
