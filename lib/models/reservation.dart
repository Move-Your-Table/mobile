import 'dart:developer';

import 'package:myt_mobile/models/lessermodels/lesser_building.dart';
import 'package:myt_mobile/models/lessermodels/lesser_desk.dart';
import 'package:myt_mobile/models/lessermodels/lesser_room.dart';
import 'package:myt_mobile/models/person.dart';

class Reservation {
  final String id;
  final LesserBuilding building;
  final LesserRoom room;
  final LesserDesk desk;
  final DateTime startTime;
  final DateTime endTime;

  Reservation({
    required this.id,
    required this.building,
    required this.room,
    required this.desk,
    required this.startTime,
    required this.endTime,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
        id: json["id"] as String,
        building: LesserBuilding.fromJson(json['building']),
        room: LesserRoom.fromJson(json["room"]),
        desk: LesserDesk.fromJson(json["desk"]),
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["startTime"]));
  }
}
