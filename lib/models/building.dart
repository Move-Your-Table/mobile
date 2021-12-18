import 'package:myt_mobile/models/desksdata.dart';
import 'package:myt_mobile/models/roomsdata.dart';

class Building {
  final String id;
  final String name;
  final String street;
  final String city;
  final String zipcode;
  final String country;
  final RoomsData rooms;
  final DesksData desks;

  Building(
      {required this.id,
      required this.name,
      required this.street,
      required this.city,
      required this.zipcode,
      required this.country,
      required this.rooms,
      required this.desks});

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
        id: json['id'] as String,
        name: json['name'] as String,
        street: json['street'] as String,
        city: json['city'] as String,
        zipcode: json['postcode'] as String,
        country: json['country'] as String,
        rooms: RoomsData.fromJson(json['rooms']),
        desks: DesksData.fromJson(json['desks']));
  }
}
