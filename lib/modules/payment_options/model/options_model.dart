class PaymentOptionModel {
  final String title;
  final String imageUrl;

  PaymentOptionModel({
    required this.title,
    required this.imageUrl,
  });

  factory PaymentOptionModel.fromMap(Map<String, String> map) {
    return PaymentOptionModel(
      title: map['title'] ?? '',
      imageUrl: map['image'] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'title': title,
      'image': imageUrl,
    };
  }
}
