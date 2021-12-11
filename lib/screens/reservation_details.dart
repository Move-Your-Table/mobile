import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservationDetails extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF161A20),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child: Image.network(
                  'https://picsum.photos/seed/674/600',
                  width: 300,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ));
  }
}
