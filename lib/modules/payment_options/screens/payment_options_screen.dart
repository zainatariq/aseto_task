import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/PaymentOptionsController.dart';
import '../widgets/payment_option_button.dart';

import '../../../routes/app_routes.dart';

class PaymentOptionsScreen extends StatelessWidget {
  final controller = Get.put(PaymentOptionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'Choose an action',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Obx(() => Column(
              children: controller.options.map((option) {
                String route = AppRoutes.paymentOptions;
                if (option.title == "Create Account") {
                  route = AppRoutes.createAccount;
                } else if (option.title == "Pay Rent") {
                  route = AppRoutes.payRent;
                } else if (option.title == "Pay Rent Saved") {
                  route = AppRoutes.payRentSaved;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: PaymentOptionButton(
                    text: option.title,
                    imageUrl: option.imageUrl,
                    onPressed: () => Get.toNamed(route),
                  ),
                );
              }).toList(),
            )),
          ],
        ),
      ),
    );
  }
}
