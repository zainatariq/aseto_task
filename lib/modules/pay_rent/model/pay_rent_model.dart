


class PayRentModel {
  final String landlordName;
  final String iban;
  final String bankName;
  final String landlordEmail;
  final String landlordPhone;
  final String address;

  PayRentModel({
    required this.landlordName,
    required this.iban,
    required this.bankName,
    required this.landlordEmail,
    required this.landlordPhone,
    required this.address,
  });

  PayRentModel copyWith({
    String? landlordName,
    String? iban,
    String? bankName,
    String? landlordEmail,
    String? landlordPhone,
    String? address,
  }) {
    return PayRentModel(
      landlordName: landlordName ?? this.landlordName,
      iban: iban ?? this.iban,
      bankName: bankName ?? this.bankName,
      landlordEmail: landlordEmail ?? this.landlordEmail,
      landlordPhone: landlordPhone ?? this.landlordPhone,
      address: address ?? this.address,
    );
  }
  factory PayRentModel.fromJson(Map<dynamic, dynamic> json) {
    return PayRentModel(
      landlordName: json['landlordName'] ?? '',
      iban: json['iban'] ?? '',
      bankName: json['bankName'] ?? '',
      landlordEmail: json['landlordEmail'] ?? '',
      landlordPhone: json['landlordPhone'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'landlordName': landlordName,
      'iban': iban,
      'bankName': bankName,
      'landlordEmail': landlordEmail,
      'landlordPhone': landlordPhone,
      'address': address,
    };
  }
}
