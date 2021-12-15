import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesksOverview extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161A20),
        body: SafeArea(
          child: Column(
            children: [_roomCard(), _deskCard()],
          ),
        ));
  }

  Widget _deskCard() {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(28, 15, 28, 15),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E222D),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(0),
                ),
                child: Image.network(
                  'https://picsum.photos/seed/586/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(17, 0, 0, 0),
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Desk 666',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFF22E95E),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: const AlignmentDirectional(0, 0),
                              child: const Text(
                                'Available',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF161A20),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
