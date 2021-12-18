import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:myt_mobile/models/building.dart';
import 'package:myt_mobile/models/desk.dart';
import 'package:myt_mobile/models/room.dart';
import 'package:myt_mobile/models/reservation.dart';

class HttpService {
  //Android SDK uses 10.0.2.2 as link to host (localhost)
  final String gatewayUrl = "http://10.0.2.2:8080/";

  Future<List<Reservation>> getReservations() async {
    Response res = await get(Uri.parse(
        gatewayUrl + "rest/reservations?userId=61b711b7160d8033a7e850b9"));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Reservation> reservations =
          body.map((dynamic item) => Reservation.fromJson(item)).toList();
      return reservations;
    } else {
      throw res.body.toString();
    }
  }

  Future<List<Desk>> getDesksFromRoom(String buildingId, String roomId) async {
    Response res = await get(Uri.parse(gatewayUrl +
        "rest/building/" +
        buildingId.toString() +
        "/room/" +
        roomId.toString() +
        "/desks"));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Desk> desks =
          body.map((dynamic item) => Desk.fromJson(item)).toList();
      return desks;
    } else {
      throw res.statusCode;
    }
  }

  Future<List<Room>> getRoomsFromBuilding(String buildingId) async {
    Response res = await get(Uri.parse(
        gatewayUrl + "rest/building/" + buildingId.toString() + "/room"));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Room> rooms =
          body.map((dynamic item) => Room.fromJson(item)).toList();
      return rooms;
    } else {
      throw res.body;
    }
  }

  Future<Building> getBuildingByID(String id) async {
    Response res =
        await get(Uri.parse(gatewayUrl + "rest/buildings/" + id.toString()));
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      Building building = Building.fromJson(body);
      return building;
    } else {
      throw res.statusCode;
    }
  }

  Future<Desk> getDeskById(
      String buildingId, String roomId, String deskId) async {
    Response res = await get(Uri.parse(gatewayUrl +
        "rest/building/" +
        buildingId.toString() +
        "/room/" +
        roomId.toString() +
        "/desks/" +
        deskId.toString()));
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      Desk desk = Desk.fromJson(body);
      return desk;
    } else {
      throw res.statusCode;
    }
  }

  Future deleteReservation(String reservationId, String buildingId,
      String roomName, String deskName) async {
    Response res = await delete(
        Uri.parse(gatewayUrl + "rest/reservations/" + reservationId.toString()),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'buildingId': buildingId,
          'roomName': roomName,
          'deskName': deskName
        }));
    if (res.statusCode == 200) {
      return res.statusCode;
    } else {
      throw (res.statusCode);
    }
  }
}
