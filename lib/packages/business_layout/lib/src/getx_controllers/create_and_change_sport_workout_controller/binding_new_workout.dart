import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';

class CreateAndChangeNewWorkoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CreateAndChangeSportWorkoutControllerGetxState());
  }
}
