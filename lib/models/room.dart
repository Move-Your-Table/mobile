class Room {
  final String buildingId;
  final String name;
  final String type;
  final int capacity;
  final int floor;
  final List<String> features;

  Room(
      {required this.buildingId,
      required this.name,
      required this.type,
      required this.capacity,
      required this.floor,
      required this.features});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
        buildingId: json['buildingId'] as String,
        name: json['roomName'] as String,
        type: json['type'] as String,
        capacity: json['capacity'] as int,
        floor: json['floor'] as int,
        features: List<String>.from(json['features']));
  }
}
