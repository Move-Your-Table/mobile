class LesserRoom {
  final int id;
  final String name;

  LesserRoom({required this.id, required this.name});

  factory LesserRoom.fromJson(Map<String, dynamic> json) {
    return LesserRoom(id: json['id'] as int, name: json['name'] as String);
  }
}
