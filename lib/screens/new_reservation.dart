import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myt_mobile/models/desk.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class NewReservation extends StatelessWidget {
  const NewReservation({Key? key, required this.desk}) : super(key: key);
  final Desk desk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161A20),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage('https://picsum.photos/seed/301/600'),
                      )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(28, 28, 28, 28),
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
                            'Reserving this Desk',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Color(0xFF8A8D8F),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 28, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF1E222D),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 20, 0, 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Reservation Start",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    "Timestamp",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[400]),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 20, 0),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.orange.shade900,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.calendar_today,
                                          color: Colors.black,
                                          size: 28.0,
                                          semanticLabel:
                                              'button to select date',
                                        ),
                                        onPressed: () {
                                          DatePicker.showDateTimePicker(context,
                                              showTitleActions: true,
                                              theme: DatePickerTheme(
                                                  itemStyle: TextStyle(
                                                      color: Colors.grey[200]),
                                                  cancelStyle: TextStyle(
                                                      color: Colors.grey[400]),
                                                  backgroundColor:
                                                      const Color(0xFF1E222D),
                                                  doneStyle: TextStyle(
                                                      color: Colors
                                                          .orange.shade900,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              minTime: DateTime.now(),
                                              maxTime: DateTime.now()
                                                  .add(const Duration(days: 7)),
                                              onChanged: (date) {
                                            print('change $date');
                                          }, onConfirm: (date) {
                                            print('confirm $date');
                                          },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.en);
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 28, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF1E222D),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 20, 0, 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Reservation End",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    "Timestamp",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[400]),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 20, 0),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.orange.shade900,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.calendar_today,
                                          color: Colors.black,
                                          size: 28.0,
                                          semanticLabel:
                                              'button to select date',
                                        ),
                                        onPressed: () {
                                          DatePicker.showDateTimePicker(context,
                                              showTitleActions: true,
                                              theme: DatePickerTheme(
                                                  itemStyle: TextStyle(
                                                      color: Colors.grey[200]),
                                                  cancelStyle: TextStyle(
                                                      color: Colors.grey[400]),
                                                  backgroundColor:
                                                      const Color(0xFF1E222D),
                                                  doneStyle: TextStyle(
                                                      color: Colors
                                                          .orange.shade900,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              minTime: DateTime.now(),
                                              maxTime: DateTime.now()
                                                  .add(const Duration(days: 7)),
                                              onChanged: (date) {
                                            print('change $date');
                                          }, onConfirm: (date) {
                                            print('confirm $date');
                                          },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.en);
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                ),
                width: double.infinity,
                child: TextButton(
                  child: const Text(
                    "Book Reservation",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => {},
                )),
          ],
        )));
  }
}
