import 'package:myt_mobile/models/lessermodels/lesser_reservation.dart';

class Desk {
  final int id;
  final String type;
  final String name;
  final int capacity;
  final int floor;
  final int incidents;
  final int buildingId;
  final int roomId;
  final List<String> features;
  final List<LesserReservation> reservations;

  Desk(
      {required this.id,
      required this.type,
      required this.name,
      required this.capacity,
      required this.floor,
      required this.incidents,
      required this.buildingId,
      required this.roomId,
      required this.features,
      required this.reservations});

  factory Desk.fromJson(Map<String, dynamic> json) {
    List reservations = json['reservations'];
    return Desk(
        id: json['id'] as int,
        type: json['type'] as String,
        name: json['name'] as String,
        capacity: json['capacity'] as int,
        floor: json['floor'] as int,
        incidents: json['incidents'] as int,
        buildingId: json['buildingId'] as int,
        roomId: json['roomId'] as int,
        features: List<String>.from(json['features']),
        reservations: reservations
            .map((res) => LesserReservation.fromJson(res))
            .toList());
  }
}
