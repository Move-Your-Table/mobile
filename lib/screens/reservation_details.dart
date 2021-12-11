import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservationDetails extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF161A20),
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
                padding: EdgeInsetsDirectional.fromSTEB(28, 28, 28, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Desk 666',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text("The Vibe | Howest",
                          style: TextStyle(
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
                    Column(
                      children: [
                        _featureItem("Test"),
                        _featureItem("Test"),
                        _featureItem("Test")
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                      child: Text('Upcomming bookings',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [_bookingItem()],
                    ),
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
        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: Container(
          child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(13, 13, 13, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mo 23/10 ",
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 15,
                      )),
                  Text("9:30 AM - 1:30 PM ",
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 15,
                      )),
                  Text("Steffen Gemin",
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 15,
                      ))
                ],
              )),
          decoration: BoxDecoration(
            color: Color(0xFF1E222D),
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
