import 'package:get/get.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/authentication_page/controller/google_auth_controller.dart';
import 'email_auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailAuthController());
    Get.lazyPut(() => GoogleAuthController());
  }
}
