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
      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
      child: Text("t",
          style: TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
            fontSize: 15,
          )),
    );
  }
}
