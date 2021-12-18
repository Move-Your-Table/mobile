import 'dart:developer';

class LesserBuilding {
  final String id;
  final String name;

  LesserBuilding({required this.id, required this.name});

  factory LesserBuilding.fromJson(Map<String, dynamic> json) {
    return LesserBuilding(
        id: json['id'] as String, name: json['name'] as String);
  }
}
