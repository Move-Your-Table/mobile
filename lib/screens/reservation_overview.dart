import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myt_mobile/services/http_service.dart';
import 'package:myt_mobile/models/reservation.dart';
import 'package:myt_mobile/models/building.dart';
import 'package:myt_mobile/screens/reservation_details.dart';

class ReservationOverview extends StatelessWidget {
  final HttpService httpService = HttpService();
  ReservationOverview({Key? key}) : super(key: key);

  Widget _reservationItem(
      String startTime, int buildingId, String company, BuildContext context) {
    return Container(
      width: 280,
      height: 220,
      margin: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
      decoration: BoxDecoration(
        color: Color(0xFF1E222D),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            child: Image.network(
              'https://picsum.photos/seed/674/600',
              width: 300,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        startTime,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(40, 40),
                          maximumSize: const Size(40, 40),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                          ),
                          primary: Colors.orange[600],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservationDetails()),
                          );
                        },
                        child: const Text('>'),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                        child: FutureBuilder(
                          future: httpService.getBuildingByID(buildingId),
                          builder: (BuildContext context,
                              AsyncSnapshot<Building> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              Building building = snapshot.data as Building;
                              return Text(
                                building.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF8A8D8F),
                                ),
                              );
                            }
                          },
                        )),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      company,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF8A8D8F),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF161A20),
        body: FutureBuilder(
          future: httpService.getReservations(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Reservation>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Reservation> reservations =
                  snapshot.data as List<Reservation>;
              return SafeArea(
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(28, 28, 0, 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Text('Upcomming\nreservations',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          height: 230,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: reservations
                                  .map((Reservation reservation) =>
                                      _reservationItem(
                                          [
                                            reservation.endTime.day,
                                            "/",
                                            reservation.endTime.month,
                                            " ",
                                            "-",
                                            " ",
                                            reservation.startTime.hour,
                                            ":",
                                            reservation.startTime.minute,
                                            " ",
                                            "-",
                                            " ",
                                            reservation.endTime.hour,
                                            ":",
                                            reservation.endTime.minute
                                          ].join(),
                                          reservation.buildingId,
                                          reservation.reservedFor.company,
                                          context))
                                  .toList()),
                        ),
                      ],
                    )),
              );
            }
          },
        ));
  }
}
