import 'package:myt_mobile/models/lessermodels/lesser_building.dart';
import 'package:myt_mobile/models/lessermodels/lesser_desk.dart';
import 'package:myt_mobile/models/lessermodels/lesser_room.dart';

class LesserReservation {
  final int id;
  final LesserBuilding building;
  final LesserRoom room;
  final LesserDesk desk;
  final DateTime startTime;
  final DateTime endTime;

  LesserReservation(
      {required this.id,
      required this.building,
      required this.room,
      required this.desk,
      required this.startTime,
      required this.endTime});

  factory LesserReservation.fromJson(Map<String, dynamic> json) {
    return LesserReservation(
        id: json["id"] as int,
        building: LesserBuilding.fromJson(json['building']),
        room: LesserRoom.fromJson(json["room"]),
        desk: LesserDesk.fromJson(json["desk"]),
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["startTime"]));
  }
}
