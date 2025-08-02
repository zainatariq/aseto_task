import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../common /app_style.dart';
 import '../../../core/util/validator.dart';
import '../../pay_rent_saved/widgets/custom_btn.dart';
import '../../pay_rent_saved/widgets/custom_text_field.dart';
import '../../pay_rent_saved/widgets/address_summary_card.dart';
import '../controller/pay_rent_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class PayRentScreen extends StatelessWidget {
  final controller = Get.put(PayRentController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Obx(() => ListView(
              children: [
                const Text("Pay Your Rent", style: AppStyles.titleStyle),
                const SizedBox(height: 8),
                const Text("Ejari upload is optional. Users must ensure legal compliance."),
                const SizedBox(height: 10),

                if (controller.hasSavedModel.value)
                  GestureDetector(
                    onTap: controller.applySavedModel,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Use previously saved address?",
                        style: TextStyle(fontSize: 12, color: Colors.indigo),
                      ),
                    ),
                  ),

                const SizedBox(height: 8),
                AddressSummaryCard(
                  address: controller.address.text.isNotEmpty
                      ? controller.address.text
                      : 'No address found',
                  onLocationFetched: (loc) => controller.address.text = loc,
                ),
                const SizedBox(height: 20),

                CustomTextField(
                  hintText: "Landlord’s Name",
                  controller: controller.landlordName,
                  validator: (val) => TValidator.normalValidator(val, hint: "Name"),
                ),
                const SizedBox(height: 14),

                CustomTextField(
                  hintText: "Landlord’s IBAN",
                  controller: controller.iban,
                  validator: (val) => TValidator.normalValidator(val, hint: "IBAN"),
                ),
                const SizedBox(height: 14),

                CustomTextField(
                  hintText: "Bank Name",
                  controller: controller.bankName,
                  validator: (val) => TValidator.normalValidator(val, hint: "Bank name"),
                ),
                const SizedBox(height: 14),

                CustomTextField(
                  hintText: "Landlord’s Email",
                  controller: controller.landlordEmail,
                  validator: (val) => TValidator.email(val, "Email"),
                ),
                const SizedBox(height: 14),

                IntlPhoneField(
                  controller: controller.landlordPhone,
                  initialCountryCode: 'AE',
                  decoration: InputDecoration(
                    labelText: 'Landlord’s Phone',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (phone) => TValidator.phone(value: phone?.number, hint: "Phone"),
                  onChanged: (phone) {},
                ),

                const SizedBox(height: 24),

                CustomButton(
                  label: "Done",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.submitForm();
                    }
                  },
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
