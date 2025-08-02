


import 'package:get/get.dart';
import '../model/options_model.dart';

class PaymentOptionsController extends GetxController {
  final options = <PaymentOptionModel>[
    PaymentOptionModel(
      title: 'Create Account',
      imageUrl: 'assets/icons/creataccount.png',
    ),
    PaymentOptionModel(
      title: 'Pay Rent',
      imageUrl: 'assets/icons/rent (1).png',
    ),
    PaymentOptionModel(
      title: 'Pay Rent Saved',
      imageUrl: 'assets/icons/rent.png',
    ),
  ].obs;
}
