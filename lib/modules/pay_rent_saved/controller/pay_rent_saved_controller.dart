



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import '../../../common /app_style.dart';
import '../../../routes/app_routes.dart';
import '../../pay_rent/model/pay_rent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/custom_btn.dart';

class PayRentSavedController extends GetxController {
  final box = GetStorage();
  PayRentModel? model;
  final TextEditingController nameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    final data = box.read('payRent');
    if (data == null) {
      Future.microtask(() => Get.offAllNamed(AppRoutes.payRent));
    } else {
      model = PayRentModel.fromJson(data);
      nameController.text = model!.landlordName;
    }
  }

  void editLandlordName() async {
    final result = await Get.dialog<String>(
      AlertDialog(
        title: const Text("Edit Landlord Name"),
        content: TextField(controller: nameController),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Get.back(),
          ),
          ElevatedButton(
            child: const Text("Save"),
            onPressed: () => Get.back(result: nameController.text.trim()),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      model = model!.copyWith(landlordName: result);
      box.write('payRent', model!.toJson());
      update();
    }
  }
}

