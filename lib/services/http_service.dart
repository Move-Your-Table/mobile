import 'dart:convert';
import 'package:http/http.dart';
import 'package:myt_mobile/models/building.dart';
import 'package:myt_mobile/models/reservation.dart';

class HttpService {
  //Android SDK uses 10.0.2.2 as link to host (localhost)
  final String gatewayUrl = "http://10.0.2.2:8080/";

  Future<List<Reservation>> getReservations() async {
    Response res =
        await get(Uri.parse(gatewayUrl + "rest/reservations?userId=1"));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Reservation> reservations =
          body.map((dynamic item) => Reservation.fromJson(item)).toList();
      return reservations;
    } else {
      throw res.statusCode;
    }
  }

  Future<Building> getBuildingByID(int id) async {
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
}