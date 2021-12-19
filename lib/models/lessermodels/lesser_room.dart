class LesserRoom {
  final String id;
  final String name;

  LesserRoom({required this.id, required this.name});

  factory LesserRoom.fromJson(Map<String, dynamic> json) {
    return LesserRoom(id: json['id'] as String, name: json['name'] as String);
  }
}
