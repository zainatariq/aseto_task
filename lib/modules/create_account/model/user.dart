



class UserModel {
  final String fullName;
  final String dob;
  final String email;
  final String phone;

  UserModel({
    required this.fullName,
    required this.dob,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] ?? '',
      dob: json['dob'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'dob': dob,
      'email': email,
      'phone': phone,
    };
  }
}
