class Room {
  final String id;
  final String buildingId;
  final String name;
  final String type;
  final int incidents;
  final int capacity;
  final int floor;
  final String features;

  Room(
      {required this.id,
      required this.buildingId,
      required this.name,
      required this.type,
      required this.incidents,
      required this.capacity,
      required this.floor,
      required this.features});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
        id: json['id'] as String,
        buildingId: json['buildingId'] as String,
        name: json['name'] as String,
        type: json['type'] as String,
        incidents: json['incidents'] as int,
        capacity: json['capacity'] as int,
        floor: json['floor'] as int,
        features: json['features'] as String);
  }
}
