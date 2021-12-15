class LesserDesk {
  final int id;
  final String name;

  LesserDesk({required this.id, required this.name});

  factory LesserDesk.fromJson(Map<String, dynamic> json) {
    return LesserDesk(id: json['id'], name: json['name']);
  }
}
