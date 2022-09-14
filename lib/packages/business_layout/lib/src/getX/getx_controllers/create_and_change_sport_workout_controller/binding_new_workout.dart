import 'package:get/get.dart';

import '../../../../business_layout.dart';

class CreateAndChangeNewWorkoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CreateAndChangeSportWorkoutControllerGetxState());
  }
}
