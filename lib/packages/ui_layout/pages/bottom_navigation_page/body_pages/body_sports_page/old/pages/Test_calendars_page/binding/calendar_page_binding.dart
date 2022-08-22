import 'package:get/get.dart';
import '../controller/calendar_page_controller.dart';

class TableBasicsExampleBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(TableBasicsController());
  }
}
