import 'package:get/get.dart';
import '../../../../business_layout.dart';

class BasicsExampleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImplementAppStateGetXController());
    Get.put(ImplementSettingGetXController());
    // Get.put(CreateAndChangeSportWorkoutControllerGetxState());
  }
}
