import 'package:myt_mobile/models/building.dart';

class LesserBuilding {
  final int id;
  final String name;

  LesserBuilding({required this.id, required this.name});

  factory LesserBuilding.fromJson(Map<String, dynamic> json) {
    return LesserBuilding(id: json['id'] as int, name: json['name'] as String);
  }
}
