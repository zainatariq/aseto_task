



import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../common /custom_loading.dart';
import '../model/user.dart';

class CreateAccountController extends GetxController {
  final box = GetStorage();

  final fullName = TextEditingController();
  final dob = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() =>
      isPasswordHidden.value = !isPasswordHidden.value;

  void toggleConfirmPasswordVisibility() =>
      isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;

  void submitFormAndContinue() {
    final user = UserModel(
      fullName: fullName.text.trim(),
      dob: dob.text.trim(),
      email: email.text.trim(),
      phone: phone.text.trim(),
    );

    Get.dialog(
        Center(child: CustomLoading()),
      barrierDismissible: false,
    );

    Future.delayed(const Duration(seconds: 2), () {
      box.write('user', user.toJson());


      Get.back();

      Get.toNamed('/pay-rent');
    });
  }
}
