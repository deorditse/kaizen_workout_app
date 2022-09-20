import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

class CalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarControllerGetxState());
  }
}
