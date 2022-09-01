import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class CalendarControllerGetXState extends GetxController {
  // final ImplementationSportsWorkoutDataServices _servicesDataLayout =
  //     ImplementationSportsWorkoutDataServices();
  static CalendarControllerGetXState instance =
      Get.find<CalendarControllerGetXState>();

  @override
  void onInit() {
    super.onInit();
  }

  //пустая тренировка
  SportsWorkoutModel sportWorkoutNewCreate = SportsWorkoutModel(
    idWorkout: '',
    nameWorkout: '',
    firstWorkoutDay: null,
    lastWorkoutDay: null,
    adminWorkout: NameAndPhotoUser(
      idUser: '',
      name: '',
      photoPath: '',
      family: '',
    ),
    descriptionWorkoutList: [],
    topUsers: {},
  );

  addFirstDay(DateTime date) {
    sportWorkoutNewCreate =
        sportWorkoutNewCreate.copyWith(firstWorkoutDay: date);
    update();
  }

  bool toggleDateIsEnd = false;

  addLastDay(DateTime? date) {
    sportWorkoutNewCreate =
        sportWorkoutNewCreate.copyWith(lastWorkoutDay: date);
    update();
  }
}
