class Record {
  final int id;
  final DateTime createdAt;
  final String date;
  final String name;
  final String prescriptions;

  Record({
    required this.id,
    required this.createdAt,
    required this.date,
    required this.name,
    required this.prescriptions,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      date: json['date'] ?? '',
      name: json['name'] ?? '',
      prescriptions: json['prescriptions'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'date': date,
      'name': name,
      'prescriptions': prescriptions,
    };
  }
}
