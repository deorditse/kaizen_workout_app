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
  List<SportsWorkoutModel> dataSportsWorkoutList = [];
  List<SportsWorkoutModel> dataSportsWorkoutListWhenIAdmin = [];
  User? myUser; //включает в себя лист с ключами тренировок

  @override
  void onInit() {
    super.onInit();
    //сначала получаю юзера из базы данных по ID
    getMyUser(idUser: 'test id').whenComplete(() {
      //получаю листы тренировок где участвует пользователь и где он админ
      print('пользователь получен');
      getDataSportWorkout();
    });
    //сразу инициируем лист данных

    print(
        'onInit_________________________________ImplementAppStateGetXController');
  }

  Future getMyUser({required String idUser}) async {
    //получаю данные пользователя
    myUser = await _servicesDataLayout.getDataUser(idUser: idUser);
    update();
  }

  getDataSportWorkout() async {
    // достаю каждую тренировку по ее ключу из базы
    if (myUser != null &&
        myUser!.listWorkoutKeys != null &&
        myUser!.listWorkoutKeys!.isNotEmpty) {
      for (var keyWorkout in myUser!.listWorkoutKeys!) {
        SportsWorkoutModel? sportWorkout = await _servicesDataLayout
            .getDataSportWorkout(idWorkout: keyWorkout);

        if (sportWorkout != null) {
          dataSportsWorkoutList.add(sportWorkout);
          update();
          print(dataSportsWorkoutList.length);
        }
      }
    }
  }
}
