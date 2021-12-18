import 'dart:developer';

import 'package:myt_mobile/models/lessermodels/lesser_reservation.dart';
import 'package:myt_mobile/models/reservation.dart';

class Desk {
  final String type;
  final String deskName;
  final int incidents;
  final String buildingId;
  final String roomName;
  final List<String> features;
  final List<Reservation> reservations;

  Desk(
      {required this.type,
      required this.deskName,
      required this.incidents,
      required this.buildingId,
      required this.roomName,
      required this.features,
      required this.reservations});

  factory Desk.fromJson(Map<String, dynamic> json) {
    List reservations = json['reservations'];
    return Desk(
        type: json['type'] as String,
        deskName: json['deskName'] as String,
        incidents: json['incidents'] as int,
        buildingId: json['buildingId'] as String,
        roomName: json['roomName'] as String,
        features: List<String>.from(json['features']),
        reservations:
            reservations.map((res) => Reservation.fromJson(res)).toList());
  }
}
