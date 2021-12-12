import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesksOverview extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161A20),
        body: SafeArea(
          child: Column(
            children: [_roomCard()],
          ),
        ));
  }

  Widget _roomCard() {
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1E222D),
        ),
        child: Row(
          children: [
            Image.network(
              'https://picsum.photos/seed/616/600',
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: SizedBox(
                height: 130,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Text(
                          'The Vibe',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Text(
                          'Sint-Jorisstraat 71, 8000 Brugge',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF8A8D8F),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 20,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.orange[800],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(0),
                ),
              ),
            )
          ],
        ));
  }
}
