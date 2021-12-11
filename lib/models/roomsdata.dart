class RoomsData {
  final int total;
  final int free;

  RoomsData({required this.total, required this.free});

  factory RoomsData.fromJson(Map<String, dynamic> json) {
    return RoomsData(total: json["total"] as int, free: json["total"] as int);
  }
}
