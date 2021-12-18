import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myt_mobile/models/reservation.dart';
import 'package:myt_mobile/models/desk.dart';
import 'package:myt_mobile/screens/reservation_overview.dart';
import 'package:myt_mobile/services/http_service.dart';

class ReservationDetails extends StatelessWidget {
  ReservationDetails(
      {Key? key, required this.reservation, required this.reservationTime})
      : super(key: key);
  final Reservation reservation;
  final String reservationTime;
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161A20),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://picsum.photos/seed/231/600'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(28, 28, 28, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reservation.desk.name,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(reservation.building.name,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF8A8D8F),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(reservation.room.name,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF8A8D8F),
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                      child: Text('Features',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    FutureBuilder(
                      future: httpService.getDeskById(reservation.building.id,
                          reservation.room.id, reservation.desk.id),
                      builder:
                          (BuildContext context, AsyncSnapshot<Desk> snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        } else {
                          Desk desk = snapshot.data as Desk;
                          return Column(
                              children: desk.features
                                  .map(
                                      (String feature) => _featureItem(feature))
                                  .toList());
                        }
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                      child: Text('Reservation timestamp:\n' + reservationTime,
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.orange.shade900,
                            borderRadius: BorderRadius.circular(5.0)),
                        width: double.infinity,
                        child: TextButton(
                          child: const Text(
                            "Cancel Reservation",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async => {
                            await httpService.deleteReservation(
                                reservation.id,
                                reservation.building.id,
                                reservation.room.name,
                                reservation.desk.name),
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReservationOverview()),
                                (route) => false)
                          },
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _featureItem(String feature) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text("- " + feature,
          style: const TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
            fontSize: 15,
          )),
    );
  }
}
