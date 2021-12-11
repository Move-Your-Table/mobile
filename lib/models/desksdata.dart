class DesksData {
  final int total;
  final int free;

  DesksData({required this.total, required this.free});

  factory DesksData.fromJson(Map<String, dynamic> json) {
    return DesksData(total: json["total"] as int, free: json["total"] as int);
  }
}
