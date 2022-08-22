import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ImplementAppStateGetXController extends GetxController {
  final ImplementationSportsWorkoutDataServices _servicesDataLayout =
      ImplementationSportsWorkoutDataServices();

  ///
  List<SportsWorkoutModel> dataSportsWorkoutList = <SportsWorkoutModel>[];
  User? myUser;

  // @override
  // void onReady() {
  //   super.onReady();
  //   print('onReady_________________________________');
  // }

  @override
  void onInit() {
    super.onInit();
    getDataSportsWorkoutList(); //сразу инициируем лист данных

    print(
        'onInit_________________________________ImplementAppStateGetXController');
  }

  getDataSportsWorkoutList() {
    _servicesDataLayout.getDataSportsWorkout().then((value) {
      dataSportsWorkoutList = value;
      update();
    });

    _servicesDataLayout.getUserData().then((value) {
      myUser = value;
      update();
    });
  }
}
