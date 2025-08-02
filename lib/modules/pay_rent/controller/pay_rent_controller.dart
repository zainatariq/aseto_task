
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common /custom_loading.dart';
import '../../pay_rent_saved/screens/pay_rent_saved_screen.dart';
import '../model/pay_rent_model.dart';


class PayRentController extends GetxController {
  final address = TextEditingController();
  final landlordName = TextEditingController();
  final iban = TextEditingController();
  final bankName = TextEditingController();
  final landlordEmail = TextEditingController();
  final landlordPhone = TextEditingController();

  final box = GetStorage();
  RxBool hasSavedModel = false.obs;

  late PayRentModel? savedModel;

  @override
  void onInit() {
    final stored = box.read('payRent');

    // Ensure it's a valid map with required fields
    if (stored is Map &&
        stored['landlordName']?.toString().isNotEmpty == true &&
        stored['iban']?.toString().isNotEmpty == true &&
        stored['address']?.toString().isNotEmpty == true) {
      savedModel = PayRentModel.fromJson(stored);
      hasSavedModel.value = true;
    } else {
      savedModel = null;
      hasSavedModel.value = false;
    }

    super.onInit();
  }


  void applySavedModel() {
    if (savedModel != null) {
      address.text = savedModel!.address;
      landlordName.text = savedModel!.landlordName;
      iban.text = savedModel!.iban;
      bankName.text = savedModel!.bankName;
      landlordEmail.text = savedModel!.landlordEmail;
      landlordPhone.text = savedModel!.landlordPhone;
    }
  }

  void submitForm() {
    final trimmedAddress = address.text.trim();

    if (trimmedAddress.isEmpty || trimmedAddress == 'No address found') {
      Get.snackbar(
        'Missing Address',
        'Please fetch your current location before submitting.',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      return;
    }

    final model = PayRentModel(
      landlordName: landlordName.text.trim(),
      iban: iban.text.trim(),
      bankName: bankName.text.trim(),
      landlordEmail: landlordEmail.text.trim(),
      landlordPhone: landlordPhone.text.trim(),
      address: trimmedAddress,
    );

    box.write('payRent', model.toJson());

    Get.dialog(const Center(child: CustomLoading()), barrierDismissible: false);

    Future.delayed(const Duration(seconds: 2), () {
      Get.back(); // Close loading dialog
      Get.snackbar(
        'Success',
        'Rent details saved successfully.',
        backgroundColor: Colors.green.shade100,
        colorText: Colors.black,
      );
      Get.to(() =>   PayRentSavedScreen());
    });
  }

}
