import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common /app_style.dart';
import '../../../core/util/validator.dart';
import '../../pay_rent_saved/widgets/custom_btn.dart';
import '../../pay_rent_saved/widgets/custom_text_field.dart';
import '../controller/create_account_controller.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class CreateAccountScreen extends StatelessWidget {
  final controller = Get.put(CreateAccountController());

  final _formKey = GlobalKey<FormState>();

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const Text("Create account", style: AppStyles.titleStyle),
                const SizedBox(height: 8),
                const Text("Enter the information below to Sign up for your account."),
                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'Full Name',
                  controller: controller.fullName,
                  validator: (v) => TValidator.normalValidator(v, hint: "Full Name"),
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 14),

                CustomTextField(
                  hintText: 'Date of Birth (MM-DD-YYYY)',
                  controller: controller.dob,
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(1900),
                      maxTime: DateTime.now(),
                      onConfirm: (date) {
                        controller.dob.text = "${date.month}-${date.day}-${date.year}";
                      },
                    );
                  },
                  validator: (v) => TValidator.normalValidator(v, hint: "Date of Birth"),
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 14),

                CustomTextField(
                  hintText: 'Email',
                  controller: controller.email,
                  validator: (v) => TValidator.email(v, "Email"),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 14),

                IntlPhoneField(
                  controller: controller.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                    ),
                  ),
                  initialCountryCode: 'AE',
                  onChanged: (phone) {},
                ),

                const SizedBox(height: 14),

                Obx(() => CustomTextField(
                  hintText: 'Password',
                  controller: controller.password,
                  obscureText: controller.isPasswordHidden.value,
                  validator: (v) => TValidator.passwordValidate(value: v, hint: "Password"),
                  suffixIcon: IconButton(
                    icon: Icon(controller.isPasswordHidden.value ? Icons.visibility : Icons.visibility_off),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  textInputAction: TextInputAction.next,
                )),

                const SizedBox(height: 14),

                Obx(() => CustomTextField(
                  hintText: 'Confirm Password',
                  controller: controller.confirmPassword,
                  obscureText: controller.isConfirmPasswordHidden.value,
                  validator: (v) => TValidator.confirmPasswordValidate(
                    value: v,
                    comparePassword: controller.password.text,
                    hint: "Confirm Password",
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(controller.isConfirmPasswordHidden.value ? Icons.visibility : Icons.visibility_off),
                    onPressed: controller.toggleConfirmPasswordVisibility,
                  ),
                  textInputAction: TextInputAction.done,
                )),

                const SizedBox(height: 24),

                CustomButton(
                  label: "Continue",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Proceed with API call or next screen
                      controller. submitFormAndContinue();
                    }
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
