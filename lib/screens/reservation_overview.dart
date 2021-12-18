import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myt_mobile/services/http_service.dart';
import 'package:myt_mobile/models/reservation.dart';
import 'package:myt_mobile/screens/reservation_details.dart';
import 'package:myt_mobile/screens/desks_overview.dart';

class ReservationOverview extends StatelessWidget {
  final HttpService httpService = HttpService();
  ReservationOverview({Key? key}) : super(key: key);

  Widget _reservationItem(Reservation reservation, String time,
      String buildingName, BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E222D),
        boxShadow: const [
          BoxShadow(
            color: Colors.transparent,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
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
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0x00EEEEEE),
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
                        time,
                        style: const TextStyle(
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
                          primary: Colors.orange[800],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservationDetails(
                                    reservation: reservation,
                                    reservationTime: time)),
                          );
                        },
                        child: const Text('>'),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                        child: Text(buildingName,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF8A8D8F),
                            ))),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      "company",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF8A8D8F),
                      ),
                    ),
                  ),
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
      backgroundColor: const Color(0xFF161A20),
      body: FutureBuilder(
        future: httpService.getReservations(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Reservation>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Reservation> reservations = snapshot.data as List<Reservation>;
            return SafeArea(
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(28, 28, 0, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
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
                      SizedBox(
                        height: 230,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: reservations
                                .map((Reservation reservation) =>
                                    _reservationItem(
                                        reservation,
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
                                        reservation.building.name,
                                        context))
                                .toList()),
                      ),
                    ],
                  )),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DesksOverview()),
          );
        },
        backgroundColor: const Color(0xFF1E222D),
        elevation: 1,
        child: Image.asset('assets/images/plus-solid.png'),
      ),
    );
  }
}
