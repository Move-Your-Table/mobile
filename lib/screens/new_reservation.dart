import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myt_mobile/models/desk.dart';

class NewReservation extends StatelessWidget {
  const NewReservation({Key? key, required this.desk}) : super(key: key);
  final Desk desk;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    desk.name,
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Reserve Desk',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Color(0xFF8A8D8F),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
