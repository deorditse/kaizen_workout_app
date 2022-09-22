import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ImplementAppStateGetXController extends GetxController {
  final ImplementationSportsWorkoutDataServices _servicesDataLayout =
      ImplementationSportsWorkoutDataServices();

  static ImplementAppStateGetXController instance =
      Get.find<ImplementAppStateGetXController>();

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
      // getDataSportWorkoutWhenIAdmin();
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
        //достаю ключи тренировок к в которых я админ
        for (var keyWorkout in myUser!.listWorkoutKeysWheIAdmin!) {
          SportsWorkoutModel? sportWorkoutWheIAdmin = await _servicesDataLayout
              .getDataSportWorkout(idWorkout: keyWorkout);

          if (sportWorkoutWheIAdmin != null) {
            dataSportsWorkoutListWhenIAdmin.add(sportWorkoutWheIAdmin);
            update();
          }
        }
        //достаю ключи тренировок к в которых я участвую по ключу
        for (var keyWorkout in myUser!.listWorkoutKeys!) {
          SportsWorkoutModel? sportWorkout = await _servicesDataLayout
              .getDataSportWorkout(idWorkout: keyWorkout);

          if (sportWorkout != null) {
            dataSportsWorkoutList.add(sportWorkout);
            update();
          }
        }
      }
    } catch (error) {
      print('error from getDataSportWorkout $error');
    }
  }

  //достаю индекс по сегодняшнему дню из листа тренирок
  int? getDataIndexInDescriptionListForWorkout(int indexWorkoutList) {
    try {
      final firstWorkoutDay =
          dataSportsWorkoutList[indexWorkoutList]?.firstWorkoutDay;

      if (firstWorkoutDay != null && firstWorkoutDay.isBefore(DateTime.now())) {
        //проверяю есть ли данные по такому индексу в листе с описанием тренировок и если есть вывожу его
        final int indexDescription =
            DateTime.now().difference(firstWorkoutDay).inDays;
        if (dataSportsWorkoutList[indexWorkoutList]
                ?.descriptionWorkoutList[indexDescription] !=
            null) {
          //проверяю есть задача тренировки на этот день в базе
          return indexDescription;
        }
      }
    } catch (error) {
      print('error from getDataIndexInDataSportsWorkoutList $error');
    }
  }

  void addNewWorkoutInDataSportWorkoutListWhenIAdmin(
      {required SportsWorkoutModel sportsWorkoutModel}) {
    try {
      dataSportsWorkoutListWhenIAdmin = [
        sportsWorkoutModel,
        ...dataSportsWorkoutListWhenIAdmin
      ];

      ///ToDo: создать id который сохраняется пользователю

      ///также обновляю лист с
      dataSportsWorkoutList = [sportsWorkoutModel, ...dataSportsWorkoutList];
      update();
    } catch (error) {
      print('error from addNewWorkoutInDataSportWorkoutList $error');
    }
  }

  // ///work with dataSportsWorkoutListWhenIAdmin - если пользователь админ
  // Future getDataSportWorkoutWhenIAdmin() async {
  //   // достаю каждую тренировку по ее ключу из базы
  //   try {
  //     if (myUser != null &&
  //         myUser!.listWorkoutKeysWheIAdmin != null &&
  //         myUser!.listWorkoutKeysWheIAdmin!.isNotEmpty) {
  //       for (var keyWorkout in myUser!.listWorkoutKeysWheIAdmin!) {
  //         SportsWorkoutModel? sportWorkout = await _servicesDataLayout
  //             .getDataSportWorkout(idWorkout: keyWorkout);
  //
  //         if (sportWorkout != null) {
  //           dataSportsWorkoutListWhenIAdmin.add(sportWorkout);
  //           update();
  //           print(dataSportsWorkoutListWhenIAdmin.length);
  //         }
  //       }
  //     }
  //   } catch (error) {
  //     print('error from getDataSportWorkout $error');
  //   }
  // }

  Future<void> updateIndexForDataSportsWorkoutList(
      {required int indexFromDataSportsWorkoutListWhenIAdmin}) async {
    //функция чтобы получить индекс в dataSportsWorkoutList когда перехожу из dataSportsWorkoutListWhenIAdmin
//для того чтобы при переходе на страницу календаря брать данные из листа со всеми тренировками

    final idWhenIAdmin = dataSportsWorkoutListWhenIAdmin[
            indexFromDataSportsWorkoutListWhenIAdmin]
        .idWorkout;

    for (var element in dataSportsWorkoutList) {
      if (idWhenIAdmin == element?.idWorkout) {
        indexWorkoutList.value = dataSportsWorkoutList.indexOf(element);
        update();
        return;
      }
    }
  }

  ///ToDo: exit
  exitTheWorkout({required String idWorkout, required BuildContext context}) {
    print('exitTheWorkout  $idWorkout');
  }

  //обновление листов после редактирования тренировки
  Future<void> updateDataSportsWorkoutListWhenIAdmin(
      {required int indexInDataSportsWorkoutListWhenIAdmin,
      required SportsWorkoutModel sportWorkoutUpdate}) async {
    try {
      dataSportsWorkoutListWhenIAdmin[indexInDataSportsWorkoutListWhenIAdmin] =
          sportWorkoutUpdate;

      await updateIndexForDataSportsWorkoutList(
          indexFromDataSportsWorkoutListWhenIAdmin:
              indexInDataSportsWorkoutListWhenIAdmin);
      print("___________________________ehllo    ${indexWorkoutList.value}");

      dataSportsWorkoutList[indexWorkoutList.value] = sportWorkoutUpdate;

      update();
    } catch (error) {
      print('error from updateDataSportsWorkoutListWhenIAdmin $error');
    }
  }
}
