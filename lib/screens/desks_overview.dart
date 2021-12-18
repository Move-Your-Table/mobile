import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myt_mobile/models/room.dart';
import 'package:myt_mobile/models/desk.dart';
import 'package:myt_mobile/screens/new_reservation.dart';
import 'package:myt_mobile/services/http_service.dart';

class DesksOverview extends StatelessWidget {
  final HttpService httpService = HttpService();
  DesksOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161A20),
        body: SafeArea(
            child: SingleChildScrollView(
          child: _roomCollection("61bd187826b85672f07e89c7", context),
        )));
  }

  Widget _roomCollection(String buildingId, BuildContext context) {
    return FutureBuilder(
        future: httpService.getRoomsFromBuilding(buildingId),
        builder: (BuildContext context, AsyncSnapshot<List<Room>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Room> rooms = snapshot.data as List<Room>;
            return Column(
              children: rooms
                  .map((Room room) => Column(
                        children: [
                          _roomCard(room),
                          FutureBuilder(
                            future: httpService.getDesksFromRoom(
                                buildingId, room.name),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Desk>> deskSnapshot) {
                              if (!deskSnapshot.hasData) {
                                return const Text(
                                  "Loading Desks...",
                                  style: TextStyle(color: Colors.white),
                                );
                              } else {
                                List<Desk> desks =
                                    deskSnapshot.data as List<Desk>;
                                return Column(
                                  children: desks
                                      .map((Desk desk) =>
                                          _deskCard(desk, context))
                                      .toList(),
                                );
                              }
                            },
                          )
                        ],
                      ))
                  .toList(),
            );
          }
        });
  }

  Widget _deskCard(Desk desk, BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(28, 15, 28, 15),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E222D),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
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
                          Text(
                            desk.deskName,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 5, 0, 0),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange[800],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextButton(
                    child: const Text(
                      ">",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  NewReservation(desk: desk)));
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _roomCard(Room room) {
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
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Text(
                          room.name,
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Text(
                          'Room Type: ' + room.type,
                          style: const TextStyle(
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
