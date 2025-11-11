import 'dart:convert';

List<DoctorModel> doctorModelFromJson(String str) => List<DoctorModel>.from(
    json.decode(str).map((x) => DoctorModel.fromJson(x)));

String doctorModelToJson(List<DoctorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorModel {
  final int id;
  final String name;
  final String category;
  final int experienceYears;
  final double rating;
  final int review;

  DoctorModel({
    required this.id,
    required this.name,
    required this.category,
    required this.experienceYears,
    required this.rating,
    required this.review,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    try {
      print('🏥 Parsing doctor JSON: $json');
      
      return DoctorModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        category: json["category"] ?? '',
        experienceYears: json["experience_years"] ?? 0,
        rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
        review: json["review"] ?? 0,
      );
    } catch (e) {
      print('❌ Error parsing DoctorModel from JSON: $e');
      print('📄 Problematic JSON: $json');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "experience_years": experienceYears,
    "rating": rating,
    "review": review,
  };
}
