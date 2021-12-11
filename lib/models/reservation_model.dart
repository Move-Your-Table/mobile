import 'package:myt_mobile/models/person_model.dart';

class Reservation {
  final int id;
  final int buildingId;
  final int roomId;
  final DateTime startTime;
  final DateTime endTime;
  final Person reservedFor;

  Reservation(
      {required this.id,
      required this.buildingId,
      required this.roomId,
      required this.startTime,
      required this.endTime,
      required this.reservedFor});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
        id: json["id"],
        buildingId: json["buildingId"],
        roomId: json["roomId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        reservedFor: json["reserved_for"]);
  }
}
