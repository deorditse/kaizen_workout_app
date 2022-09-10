import 'package:business_layout/src/getX/getx_controllers/calendar_controller/widgets/default_dialog_create_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:style_app/style_app.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class CalendarControllerGetXState extends GetxController {
  static CalendarControllerGetXState instance =
      Get.find<CalendarControllerGetXState>();

  bool toggleDateIsEnd = false;
  bool isHoliday = false;
  int? itemCount = null;

  //создаю лист тренировки который можно редактировать и потом при нажатии на кнопку создать тренировку копирую его в sportWorkoutNewCreate
  List<String?> descriptionWorkoutList = [];

  //пустая тренировка
  SportsWorkoutModel sportWorkoutNewCreate = SportsWorkoutModel(
    idWorkout: '',
    nameWorkout: '',
    firstWorkoutDay: DateTime.now(),
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

  void addFirstDay(DateTime date) {
    sportWorkoutNewCreate =
        sportWorkoutNewCreate.copyWith(firstWorkoutDay: date);
    if (sportWorkoutNewCreate.lastWorkoutDay != null) {
      sportWorkoutNewCreate.firstWorkoutDay.add(const Duration(days: 1));
      _countDaysWorkout();
    }
    update();
  }

  void addLastDay(DateTime? date) {
    sportWorkoutNewCreate =
        sportWorkoutNewCreate.copyWith(lastWorkoutDay: date);
    _countDaysWorkout();
    update();
  }

  //считаем разниццу между последним и первым днем
  void _countDaysWorkout() {
    try {
      int? result = sportWorkoutNewCreate.lastWorkoutDay
          ?.difference(sportWorkoutNewCreate.firstWorkoutDay)
          .inDays;
      print(result);
      itemCount = result;
      _createDescriptionWorkoutList();
      update();
    } catch (error) {
      print('ошибка из _countDaysWorkout ${error}');
    }
  }

  void updateTaskForTheDay({
    required indexDay,
    String? value,
    bool? togleIsHoliday,
    bool? toggleRepeatToTheEndOfTheList,
    int? repeatWithIndex,
  }) {
    try {
      if (togleIsHoliday != null && togleIsHoliday) {
        descriptionWorkoutList[indexDay] = value;
        update();
        return;
      }
      if (toggleRepeatToTheEndOfTheList != null &&
          toggleRepeatToTheEndOfTheList &&
          repeatWithIndex != null) {
        for (repeatWithIndex;
            repeatWithIndex! < descriptionWorkoutList.length;
            repeatWithIndex++) {
          descriptionWorkoutList[repeatWithIndex] = value;
          update();
        }
        return;
      }
      descriptionWorkoutList[indexDay] = value;
      update();
    } catch (e) {
      print('ошибка из updateTaskForTheDay ${e}');
    }
  }

  void _createDescriptionWorkoutList() {
    descriptionWorkoutList = List.generate(itemCount ?? 100, (_) => null);
    update();
  }

  void createSportWorkoutButtonTap({required context}) {
    try {
      if (descriptionWorkoutList.contains(null)) {
        mySnackBarButton(
          context: context,
          title: "Не все дни заполнены",
          message:
              'Заполните каждый день тренировки или нажмите повторить до конца списка',
        );
      } else {
        sportWorkoutNewCreate = sportWorkoutNewCreate.copyWith(
            descriptionWorkoutList: descriptionWorkoutList);
        update();

        //тренировка создана
        defaultDialogAboutSports(
            context: context, idWorkout: sportWorkoutNewCreate.idWorkout);

        //test
        Get.defaultDialog(
            content: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: SingleChildScrollView(
            child: Text(
              sportWorkoutNewCreate.toString(),
            ),
          ),
        ));

        ///ToDo: create send workout in DB
      }
    } catch (error) {
      print('ошибка из createSportWorkoutButtonTap ${error}');
    }
  }
}
