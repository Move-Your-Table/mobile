import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myt_mobile/models/desk.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myt_mobile/screens/reservation_overview.dart';

class NewReservation extends StatefulWidget {
  const NewReservation({Key? key, required this.desk}) : super(key: key);
  final Desk desk;

  @override
  _NewReservationState createState() => _NewReservationState();
}

class _NewReservationState extends State<NewReservation> {
  String timeStart = "select start time";
  String timeEnd = "select end time";
  DateTime startMin = DateTime.now();
  DateTime endMin = DateTime.now();
  DateTime startMax = DateTime.now().add(const Duration(days: 7));
  DateTime endMax = DateTime.now().add(const Duration(days: 7));
  String timeStartSub = "";
  String timeEndSub = "";
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
                            widget.desk.deskName,
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
                                                    timeStart,
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
                                              "button to make select start time",
                                        ),
                                        onPressed: () {
                                          // START TIME
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
                                              minTime: startMin,
                                              maxTime: startMax
                                                  .add(const Duration(days: 7)),
                                              onChanged: (dateTime) {
                                            log(dateTime.toIso8601String());
                                          }, onConfirm: (date) {
                                            setState(() {
                                              timeStart = [
                                                date.day,
                                                "/",
                                                date.month,
                                                "/",
                                                date.year,
                                                " ",
                                                date.hour > 9
                                                    ? date.hour
                                                    : ["0", date.hour].join(),
                                                ":",
                                                date.minute > 9
                                                    ? date.minute
                                                    : ["0", date.minute].join()
                                              ].join();
                                              timeStartSub =
                                                  date.toIso8601String();
                                            });
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
                                                    timeEnd,
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
                                              minTime: endMin,
                                              maxTime: endMax,
                                              onChanged: (time) {
                                            log(time.toString());
                                          }, onConfirm: (date) {
                                            setState(() {
                                              timeEnd = [
                                                date.day,
                                                "/",
                                                date.month,
                                                "/",
                                                date.year,
                                                " ",
                                                date.hour > 9
                                                    ? date.hour
                                                    : ["0", date.hour].join(),
                                                ":",
                                                date.minute > 9
                                                    ? date.minute
                                                    : ["0", date.minute].join()
                                              ].join();
                                              timeEndSub =
                                                  date.toIso8601String();
                                            });
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
                  onPressed: () => {_validateDates()},
                )),
          ],
        )));
  }

  _validateDates() {
    if (timeStartSub != "" && timeEndSub != "") {
      if (DateTime.parse(timeEndSub).isAfter(DateTime.parse(timeStartSub))) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ReservationOverview()),
            (route) => false);
      } else {
        Fluttertoast.showToast(
          msg:
              "Please make sure your reservation end comes after reservation start.",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red.shade500,
        );
      }
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG,
          msg: "Please make sure reservation start AND end are selected.");
    }
  }
}
