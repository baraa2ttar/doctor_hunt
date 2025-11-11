class SpecializationModel {
  final int id;
  final String name;
  final String degree;
  final String specializationName;
  final String? image;

  // Only needed for parent Specialization that holds list of doctors
  final List<SpecializationModel> doctors;

  SpecializationModel({
    this.id = 0,
    required this.name,
    required this.degree,
    required this.specializationName,
    this.image,
    this.doctors = const [],
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(
      name: json['name'] ?? '',
      degree: json['degree'] ?? '',
      specializationName: json['specialization']['name'] ?? '',
    );
  }

  SpecializationModel copyWithImage(String imagePath) {
    return SpecializationModel(
      name: name,
      degree: degree,
      specializationName: specializationName,
      image: imagePath,
    );
  }
}

