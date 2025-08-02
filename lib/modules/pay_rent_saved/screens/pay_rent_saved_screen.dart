import 'package:flutter/material.dart';
import '../../../common /app_style.dart';
import '../../../routes/app_routes.dart';
import '../controller/pay_rent_saved_controller.dart';
import '../widgets/address_summary_card.dart';
import '../widgets/custom_btn.dart';
import 'package:get/get.dart';

class PayRentSavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayRentSavedController>(
      init: PayRentSavedController(),
      builder: (controller) {
        if (controller.model == null) return const SizedBox();

        final model = controller.model!;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text("Pay Your Rent", style: AppStyles.titleStyle),
                  const SizedBox(height: 8),
                  const Text("Ejari upload is optional. Users must ensure legal compliance."),
                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address Summary", style: AppStyles.hintStyle),
                        const SizedBox(height: 6),
                        Text(model.address, style: AppStyles.fieldStyle),
                        const Divider(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Landlord Name", style: AppStyles.hintStyle),
                            IconButton(
                              icon: const Icon(Icons.edit, size: 18),
                              onPressed: controller.editLandlordName,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(model.landlordName, style: AppStyles.fieldStyle),
                        const SizedBox(height: 14),
                        _infoTile("IBAN", model.iban),
                        _infoTile("Email", model.landlordEmail),
                        _infoTile("Phone", model.landlordPhone),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    label: "Continue",
                    onPressed: () => Get.toNamed(AppRoutes.paymentOptions),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _infoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.hintStyle),
        const SizedBox(height: 4),
        Text(value, style: AppStyles.fieldStyle),
        const SizedBox(height: 14),
      ],
    );
  }
}
