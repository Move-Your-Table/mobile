import "package:flutter/material.dart";
import 'package:myt_mobile/screens/reservation_overview.dart';
import "screens/reservation_overview.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ReservationOverview());
  }
}
