import 'package:get/get.dart';
import '../modules/create_account/screens/create_account_screen.dart';
import '../modules/pay_rent/screens/pay_rent_screen.dart';
import '../modules/pay_rent_saved/screens/pay_rent_saved_screen.dart';
import '../modules/payment_options/screens/payment_options_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.paymentOptions,
      page: () => PaymentOptionsScreen(),
    ),
    GetPage(
      name: AppRoutes.createAccount,
      page: () => CreateAccountScreen(),
    ),
    GetPage(
      name: AppRoutes.payRent,
      page: () => PayRentScreen(),
    ),
    GetPage(
      name: AppRoutes.payRentSaved,
      page: () => PayRentSavedScreen(),
    ),
  ];
}
