class UserModel {
  final int? id;
  final String? name;
  final String? mobile;
  final String? email;
  final String? gender;

  UserModel({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.gender

  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      mobile: json['phone'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  Map<String, String> toFormData({
  String? updatedName,
  String? updatedPhone,
}) {
  return {
    'id': id?.toString() ?? '',
    'name': updatedName?.trim().isNotEmpty == true ? updatedName!.trim() : name ?? '',
    'email': email ?? '',
    'phone': updatedPhone?.trim().isNotEmpty == true ? updatedPhone!.trim() : mobile ?? '',
    'gender': gender ?? '',

  };
  }
}
