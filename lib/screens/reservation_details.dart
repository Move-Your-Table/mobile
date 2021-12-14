import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myt_mobile/models/reservation.dart';
import 'package:myt_mobile/models/desk.dart';
import 'package:myt_mobile/services/http_service.dart';

class ReservationDetails extends StatelessWidget {
  ReservationDetails({Key? key, required this.reservation}) : super(key: key);
  final Reservation reservation;
  final HttpService httpService = HttpService();
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
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          Desk desk = snapshot.data as Desk;
                          return Column(
                              children: desk.features
                                  .map(
                                      (String feature) => _featureItem(feature))
                                  .toList());
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _featureItem(String feature) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
      child: Text(feature,
          style: const TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
            fontSize: 15,
          )),
    );
  }

  Widget _bookingItem() {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
        child: Container(
          child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(13, 13, 13, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Mo 23/10 ",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 15,
                      )),
                  Text("9:30 AM - 1:30 PM ",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 15,
                      )),
                  Text("Steffen Gemin",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 15,
                      ))
                ],
              )),
          decoration: BoxDecoration(
            color: const Color(0xFF1E222D),
            boxShadow: const [
              BoxShadow(
                color: Colors.transparent,
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
