import 'dart:math';
import 'package:business_layout/src/getX/getx_controllers/create_and_change_sport_workout_controller/widgets/default_dialog_create_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:style_app/style_app.dart';
import '../../../../business_layout.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class CreateAndChangeSportWorkoutControllerGetxState extends GetxController {
  static CreateAndChangeSportWorkoutControllerGetxState instance =
      Get.find<CreateAndChangeSportWorkoutControllerGetxState>();
  String idWorkout = '0000';
  String nameWorkout = 'тренировка';
  DateTime firstWorkoutDay = DateTime.now();
  DateTime? lastWorkoutDay;
  bool toggleDateIsEnd = false;
  bool isHoliday = false;
  int? itemCount;
  NameAndPhotoUser? adminWorkout;
  List<String?> descriptionWorkoutListFromCreatePage = [];
  SportsWorkoutModel? _sportWorkoutNewCreate;

  @override
  void onInit() {
    super.onReady();
    //при инициации создаем id будущей тренировки
    final _dataUser = ImplementAppStateGetXController.instance.myUser;
    if (_dataUser != null) {
      adminWorkout = NameAndPhotoUser(
        //упрощенная модель юзера для предварительного просмотра
        idUser: _dataUser.idUser,
        name: _dataUser.name ?? 'anonymous',
        photoPath: _dataUser.photoPath,
        family: _dataUser.family,
      );
      update();
    }
    initializedCreateNewWorkout();
    print('onInit() in CreateAndChangeSportWorkoutControllerGetxState');
  }

  //пустая тренировка
  Future<void> initializedCreateNewWorkout() async {
    //сразу добавлю id тренировки и пользователя - будет администратором
    try {
      await _createIdWorkout(); //присваиваю id
    } catch (error) {
      print('error from initializedCreateNewWorkout $error');
    }
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

  Future<void> _updateAllDataInSportWorkoutNewCreate() async {
    try {
      if (adminWorkout != null) {
        _sportWorkoutNewCreate = SportsWorkoutModel(
          idWorkout: idWorkout,
          nameWorkout: nameWorkout,
          firstWorkoutDay: firstWorkoutDay,
          lastWorkoutDay: lastWorkoutDay,
          adminWorkout: adminWorkout!,
          descriptionWorkoutList: descriptionWorkoutListFromCreatePage,
          usersInWorkout: {adminWorkout!},
        );
        update();
      } else {
        mySnackBarButton(title: 'Пользователь не распознан', message: '');
      }
    } catch (error) {
      print('ошибка из _updateAllDataInSportWorkoutNewCreate $error');
    }
  }

  Future<void> createNewSportWorkoutFromCreateWorkoutPage(
      {required context}) async {
    try {
      if (lastWorkoutDay == null && !toggleDateIsEnd) {
        mySnackBarButton(
          context: context,
          title: "обязательное поле*",
          message: "В пункте 2 выберите дату окончания тренировки",
        );
      } else if (descriptionWorkoutListFromCreatePage.contains(null)) {
        mySnackBarButton(
          context: context,
          title: "Не все дни заполнены",
          message:
              'Заполните каждый день тренировки или нажмите повторить до конца списка',
        );
      } else {
        //добавляем тренировку в список тренировок и в БД

        //обновляю данные в sportWorkoutNewCreate
        await _updateAllDataInSportWorkoutNewCreate();
        //добавляю тренировку в свой лист тренировок и сохраняю в базу данных
        //добавляю тренировку в лист всех тренировок и созданных мною
        ImplementAppStateGetXController.instance
            .addNewWorkoutInDataSportWorkoutList(
                sportsWorkoutModel: _sportWorkoutNewCreate!);
        //save NewSportWorkoutInDataBase
        await _saveNewSportWorkoutInDataBase(
            sportsWorkoutModel: _sportWorkoutNewCreate!);

        //тренировка создана
        defaultDialogAboutSports(
            context: context, idWorkout: _sportWorkoutNewCreate!.idWorkout);

        // //test
        // Get.defaultDialog(
        //   content: Container(
        //     height: MediaQuery.of(context).size.height * 0.7,
        //     child: SingleChildScrollView(
        //       child: Text(
        //         _sportWorkoutNewCreate.toString(),
        //       ),
        //     ),
        //   ),
        // );

        //очищаем все поля в create после создания тренировки
        clearAllDataInNewSportWorkout();
      }
    } catch (error) {
      print('ошибка из createSportWorkoutButtonTap ${error}');
    }
  }

  _saveNewSportWorkoutInDataBase({required sportsWorkoutModel}) {
    print('    ///ToDo: create send workout in DB');

    ///ToDo: create send workout in DB
  }

  Future<void> _createIdWorkout() async {
    idWorkout = Random().nextInt(9999).toString();
    nameWorkout = '$nameWorkout $idWorkout';
    update();
  }

  Future<void> clearAllDataInNewSportWorkout() async {
    firstWorkoutDay = DateTime.now();
    lastWorkoutDay = null;
    toggleDateIsEnd = false;
    isHoliday = false;
    itemCount = null;
    // adminWorkout = null;
    descriptionWorkoutListFromCreatePage = [];
    _sportWorkoutNewCreate = null;
    idWorkout = '';
    await _createIdWorkout();
    updateNameWorkout(newNameSportWorkout: 'тренировка $idWorkout');
    update();
  }

  void changeToggleDateIsEnd() {
    toggleDateIsEnd = !toggleDateIsEnd;
    update();
  }

  /// для редактирования тренировки
  Future<void> editSportWorkoutFromEditWorkoutPage(
      {required SportsWorkoutModel sportsWorkoutModelForEdit}) async {
    addFirstDay(sportsWorkoutModelForEdit.firstWorkoutDay);

    addLastDay(sportsWorkoutModelForEdit.lastWorkoutDay);

    toggleDateIsEnd = (lastWorkoutDay == null) ? true : false;

    adminWorkout = sportsWorkoutModelForEdit.adminWorkout;

    descriptionWorkoutListFromCreatePage =
        sportsWorkoutModelForEdit.descriptionWorkoutList;

    idWorkout = sportsWorkoutModelForEdit.idWorkout;

    updateNameWorkout(
        newNameSportWorkout: sportsWorkoutModelForEdit.nameWorkout);

    update();
  }

  Future<void> updateEditWorkoutButtonTap({required context}) async {
    try {
      final controllerSportWorkout =
          CreateAndChangeSportWorkoutControllerGetxState.instance;

      if (controllerSportWorkout.lastWorkoutDay == null &&
          !controllerSportWorkout.toggleDateIsEnd) {
        mySnackBarButton(
          context: context,
          title: "обязательное поле*",
          message: "В пункте 2 выберите дату окончания тренировки",
        );
      } else {
        //обновляем тренировку и в БД
        controllerSportWorkout.updateEditWorkoutButtonTap(context: context);
      }
    } catch (error) {
      print('error from _createWorkout $error');
    }
  }

  ///
}
