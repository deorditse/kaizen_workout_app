import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
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

  String idWorkout = '0000';
  String nameWorkout = 'тренировка';
  DateTime firstWorkoutDay = DateTime.now();
  DateTime? lastWorkoutDay;
  bool toggleDateIsEnd = false;
  bool isHoliday = false;
  int? itemCount;
  late NameAndPhotoUser adminWorkout;
  List<String?> descriptionWorkoutListFromCreatePage = [];

  //пустая тренировка
  late SportsWorkoutModel _sportWorkoutNewCreate;

  initializedCreateNewWorkout() async {
    //сразу добавлю id тренировки и пользователя - будет администратором

    await _createIdWorkout();

    final _dataUser = ImplementAppStateGetXController.instance.myUser;
    adminWorkout = NameAndPhotoUser(
      //упрощенная модель юзера для предварительного просмотра
      idUser: _dataUser!.idUser,
      name: _dataUser.name ?? 'no name',
      photoPath: _dataUser.photoPath,
      family: _dataUser.family,
    );

    //пустая тренировка
    _sportWorkoutNewCreate = SportsWorkoutModel(
      idWorkout: idWorkout,
      nameWorkout: nameWorkout,
      firstWorkoutDay: firstWorkoutDay,
      lastWorkoutDay: lastWorkoutDay,
      adminWorkout: adminWorkout,
      descriptionWorkoutList: descriptionWorkoutListFromCreatePage,
    );
  }

  void addFirstDay(DateTime date) {
    firstWorkoutDay = date;
    update();
    if (lastWorkoutDay != null) {
      firstWorkoutDay.add(const Duration(days: 1));
      update();
      _countDaysWorkout();
    }
  }

  void addLastDay(DateTime? date) {
    lastWorkoutDay = date;
    update();
    _countDaysWorkout();
  }

  //считаем разниццу между последним и первым днем
  void _countDaysWorkout() {
    try {
      int? result = lastWorkoutDay?.difference(firstWorkoutDay).inDays;
      print(result);
      itemCount = result;
      _createDescriptionWorkoutList();
      update();
    } catch (error) {
      print('ошибка из _countDaysWorkout $error');
    }
  }

  void updateNameWorkout({String? newNameSportWorkout}) {
    try {
      nameWorkout = newNameSportWorkout ?? nameWorkout;
      update();
    } catch (error) {
      print('ошибка из updateNameWorkout $error');
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

  _updateAllDataInSportWorkoutNewCreate() {
    _sportWorkoutNewCreate = _sportWorkoutNewCreate.copyWith(
      idWorkout: idWorkout,
      nameWorkout: nameWorkout,
      firstWorkoutDay: firstWorkoutDay,
      lastWorkoutDay: lastWorkoutDay,
      adminWorkout: adminWorkout,
      descriptionWorkoutList: descriptionWorkoutListFromCreatePage,
    );
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
        //тренировка создана
        defaultDialogAboutSports(
            context: context, idWorkout: _sportWorkoutNewCreate.idWorkout);

        //test
        Get.defaultDialog(
            content: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: SingleChildScrollView(
            child: Text(
              _sportWorkoutNewCreate.toString(),
            ),
          ),
        ));

        //обновляю данные в sportWorkoutNewCreate
        _updateAllDataInSportWorkoutNewCreate();
        //добавляю тренировку в свой лист тренировок и сохраняю в базу данных
        ImplementAppStateGetXController.instance
            .addNewWorkoutInDataSportWorkoutList(
                sportsWorkoutModel: _sportWorkoutNewCreate);
        //save NewSportWorkoutInDataBase
        await _saveNewSportWorkoutInDataBase(
            sportsWorkoutModel: _sportWorkoutNewCreate);
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
    idWorkout = '0007';
    nameWorkout = '$nameWorkout $idWorkout';
    update();
  }
}
