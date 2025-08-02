import 'package:aseto_task/routes/app_pages.dart';
import 'package:aseto_task/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'modules/payment_options/screens/payment_options_screen.dart';

 main() async {
  await GetStorage.init();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Payment Options',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Poppins',
      ),
      initialRoute: AppRoutes.paymentOptions,
      getPages: AppPages.pages,
    );
  }
}
