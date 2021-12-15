import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewReservation extends StatelessWidget {
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
                image: NetworkImage('https://picsum.photos/seed/301/600'),
              )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(28, 28, 28, 28),
              child: Column(
                children: const [
                  Text(
                    "Desk Title",
                    style: TextStyle(
                        fontFamily: 'Poppins', color: Color(0xFF8A8D8F)),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
