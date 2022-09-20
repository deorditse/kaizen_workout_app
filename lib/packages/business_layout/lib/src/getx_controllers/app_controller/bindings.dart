import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart'; //импортить только в таком формате

class BasicsExampleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImplementAppStateGetXController());
    Get.put(ImplementSettingGetXController());
    // Get.put(CreateAndChangeSportWorkoutControllerGetxState());
  }
}
