class Person {
  final int id;
  final String firstName;
  final String lastName;
  final String company;

  Person(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.company});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        id: json['id'] as int,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        company: json['company'] as String);
  }
}
