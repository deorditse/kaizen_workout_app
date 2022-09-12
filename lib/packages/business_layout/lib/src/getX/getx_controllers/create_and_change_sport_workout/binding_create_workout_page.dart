import 'package:business_layout/src/getX/getx_controllers/create_and_change_sport_workout/create_and_change_sport_workout_controller_getx_state.dart';
import 'package:get/get.dart';

class CreateAndChangeSportWorkoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CreateAndChangeSportWorkoutControllerGetxState());
  }
}
