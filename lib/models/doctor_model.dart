class Doctor {
  final int id;
  final String name;
  final String specialty;
  final String experienceYears;
  final int patientStories;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.experienceYears,
    required this.patientStories,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      experienceYears: json['experience_years'],
      patientStories: json['patient_stories'],
    );
  }
}
