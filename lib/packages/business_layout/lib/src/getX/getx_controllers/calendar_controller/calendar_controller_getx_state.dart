import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:style_app/style_app.dart';
import '../../../../business_layout.dart';
import 'widgets/default_dialog_create_key.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class CalendarControllerGetXState extends GetxController {
  static CalendarControllerGetXState instance =
      Get.find<CalendarControllerGetXState>();

  @override
  void onReady() {
    super.onReady();
    //при инициации создаем id будущей тренировки
    initializedCreateNewWorkout();
  }

  initializedCreateNewWorkout() async {
    await _createIdWorkout();
  }

  int idWorkout = 0000;
  bool toggleDateIsEnd = false;
  bool isHoliday = false;
  int? itemCount = null;

  //создаю лист тренировки который можно редактировать и потом при нажатии на кнопку создать тренировку копирую его в sportWorkoutNewCreate
  List<String?> descriptionWorkoutListFromCreatePage = [];

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
    //сразу добавлю id и пользователя
    final _dataUser = ImplementAppStateGetXController.instance.myUser;
    NameAndPhotoUser _myUserAdmin = NameAndPhotoUser(
      idUser: _dataUser!.idUser,
      name: _dataUser.name ?? 'no name',
      photoPath: _dataUser.photoPath,
      family: _dataUser.family,
    );

    sportWorkoutNewCreate = sportWorkoutNewCreate.copyWith(
      firstWorkoutDay: date,
      idWorkout: idWorkout.toString(),
      adminWorkout: _myUserAdmin,
    );

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
        descriptionWorkoutListFromCreatePage[indexDay] = value;
        update();
        return;
      }
      if (toggleRepeatToTheEndOfTheList != null &&
          toggleRepeatToTheEndOfTheList &&
          repeatWithIndex != null) {
        for (repeatWithIndex;
            repeatWithIndex! < descriptionWorkoutListFromCreatePage.length;
            repeatWithIndex++) {
          descriptionWorkoutListFromCreatePage[repeatWithIndex] = value;
          update();
        }
        return;
      }
      descriptionWorkoutListFromCreatePage[indexDay] = value;
      update();
    } catch (e) {
      print('ошибка из updateTaskForTheDay ${e}');
    }
  }

  void _createDescriptionWorkoutList() {
    descriptionWorkoutListFromCreatePage =
        List.generate(itemCount ?? 1, (_) => null);
    update();
  }

  Future<void> createNewSportWorkoutFromCreateWorkoutPage(
      {required context}) async {
    try {
      if (descriptionWorkoutListFromCreatePage.contains(null)) {
        mySnackBarButton(
          context: context,
          title: "Не все дни заполнены",
          message:
              'Заполните каждый день тренировки или нажмите повторить до конца списка',
        );
      } else {
        sportWorkoutNewCreate = sportWorkoutNewCreate.copyWith(
            descriptionWorkoutList: descriptionWorkoutListFromCreatePage);
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

        //добавляю тренировку в свой лист тренировок и сохраняю в базу данных
        ImplementAppStateGetXController.instance
            .addNewWorkoutInDataSportWorkoutList(
                sportsWorkoutModel: sportWorkoutNewCreate);
        //save NewSportWorkoutInDataBase
        await _saveNewSportWorkoutInDataBase(
            sportsWorkoutModel: sportWorkoutNewCreate);
      }
    } catch (error) {
      print('ошибка из createSportWorkoutButtonTap ${error}');
    }
  }

  _saveNewSportWorkoutInDataBase(
      {required SportsWorkoutModel sportsWorkoutModel}) {
    print('    ///ToDo: create send workout in DB');

    ///ToDo: create send workout in DB
  }

  Future<void> _createIdWorkout() async {
    idWorkout = 0007;
    update();
  }
}
