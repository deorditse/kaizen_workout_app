import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ImplementAppStateGetXController extends GetxController {
  final ImplementationSportsWorkoutDataServices _servicesDataLayout =
      ImplementationSportsWorkoutDataServices();

  static ImplementAppStateGetXController instance = Get.find();

  ///
  List<SportsWorkoutModel?> dataSportsWorkoutList = [];
  Rx<int> indexWorkoutList = 0.obs;
  List<SportsWorkoutModel> dataSportsWorkoutListWhenIAdmin = [];
  User? myUser; //включает в себя лист с ключами тренировок

  // Rx<int> indexInDataSportsWorkoutList = 0.obs;
  @override
  void onInit() {
    super.onInit();
    //сначала получаю юзера из базы данных по ID
    getMyUser(idUser: 'test id ___ test').whenComplete(() {
      //получаю листы тренировок где участвует пользователь и где он админ
      print('пользователь получен');
      getDataSportWorkout();
      getDataSportWorkoutWhenIAdmin();
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

  ///work with dataSportsWorkoutList

  Future getDataSportWorkout() async {
    // достаю каждую тренировку по ее ключу из базы

    try {
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
    } catch (error) {
      print('error from getDataSportWorkout $error');
    }
  }

  int? getDataIndexInDataSportsWorkoutList(int indexWorkoutList) {
    try {
      final firstWorkoutDay =
          dataSportsWorkoutList[indexWorkoutList]?.firstWorkoutDay;
      if (firstWorkoutDay != null && firstWorkoutDay.isBefore(DateTime.now())) {
        final indexDescript = DateTime.now().difference(firstWorkoutDay).inDays;
        //проверяю есть ли тренировка на этот день в базе
        return dataSportsWorkoutList[indexWorkoutList]!
                    .descriptionWorkoutList[indexDescript] !=
                null
            ? indexDescript
            : null;
      } else {
        return null;
      }
    } catch (error) {
      print('error from getDataIndexInDataSportsWorkoutList $error');
    }
  }

  void addNewWorkoutInDataSportWorkoutList({required sportsWorkoutModel}) {
    try {
      dataSportsWorkoutListWhenIAdmin = [
        ...dataSportsWorkoutListWhenIAdmin,
        sportsWorkoutModel
      ];
      dataSportsWorkoutList = [sportsWorkoutModel, ...dataSportsWorkoutList];
      update();
    } catch (error) {
      print('error from addNewWorkoutInDataSportWorkoutList $error');
    }
  }

  ///work with dataSportsWorkoutListWhenIAdmin - если пользователь админ

  Future getDataSportWorkoutWhenIAdmin() async {
    // достаю каждую тренировку по ее ключу из базы
    try {
      if (myUser != null &&
          myUser!.listWorkoutKeysWheIAdmin != null &&
          myUser!.listWorkoutKeysWheIAdmin!.isNotEmpty) {
        for (var keyWorkout in myUser!.listWorkoutKeysWheIAdmin!) {
          SportsWorkoutModel? sportWorkout = await _servicesDataLayout
              .getDataSportWorkout(idWorkout: keyWorkout);

          if (sportWorkout != null) {
            dataSportsWorkoutListWhenIAdmin.add(sportWorkout);
            update();
            print(dataSportsWorkoutListWhenIAdmin.length);
          }
        }
      }
    } catch (error) {
      print('error from getDataSportWorkout $error');
    }
  }
}
