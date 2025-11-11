class SimpleDoctor {
  final String name;
  final String startTime;

  SimpleDoctor({required this.name, required this.startTime});

  factory SimpleDoctor.fromJson(Map<String, dynamic> json) {
    return SimpleDoctor(
      name: json['name'] ?? '',
      startTime: json['start_time'] ?? '',
    );
  }
}
