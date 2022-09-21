import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';
import 'package:style_app/style_app.dart';
import 'package:business_layout/business_layout.dart';
import 'widgets/default_dialog_create_key.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class CreateAndChangeSportWorkoutControllerGetxState extends GetxController {
  static CreateAndChangeSportWorkoutControllerGetxState instance =
      Get.find<CreateAndChangeSportWorkoutControllerGetxState>();
  String idWorkout = "...";
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
    super.onInit();
    _initialized();
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

    //теперь надо сделать проверку идет ли редактирование или нет
    // initializedCreateNewWorkout();
    print('onInit() in CreateAndChangeSportWorkoutControllerGetxState');
  }

  Future<void> _initialized() async {
    if (idWorkout == '') {
      await _createIdWorkout();
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

  Future<void> _createIdWorkout() async {
    idWorkout = Random().nextInt(9999).toString();
    nameWorkout = '$nameWorkout $idWorkout';
    update();
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
            .addNewWorkoutInDataSportWorkoutListWhenIAdmin(
                sportsWorkoutModel: _sportWorkoutNewCreate!);
        //save NewSportWorkoutInDataBase
        await _saveNewSportWorkoutInDataBase(
            sportsWorkoutModel: _sportWorkoutNewCreate!);

        //тренировка создана
        defaultDialogAboutSports(
            context: context, idWorkout: _sportWorkoutNewCreate!.idWorkout);
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
    updateNameWorkout(newNameSportWorkout: 'тренировка $idWorkout');
    update();
  }

  void changeToggleDateIsEnd() {
    toggleDateIsEnd = !toggleDateIsEnd;
    update();
  }

  /// для редактирования тренировки________________________________________________________________
  Future<void> editSportWorkoutFromEditWorkoutPage(
      {required int indexInDataSportsWorkoutListWhenIAdmin}) async {
    final SportsWorkoutModel sportsWorkoutModelForEdit =
        ImplementAppStateGetXController
                .instance.dataSportsWorkoutListWhenIAdmin[
            indexInDataSportsWorkoutListWhenIAdmin];

    //обновляю все данные полей
    addFirstDay(sportsWorkoutModelForEdit.firstWorkoutDay);

    addLastDay(sportsWorkoutModelForEdit.lastWorkoutDay);

    toggleDateIsEnd =
        (sportsWorkoutModelForEdit.lastWorkoutDay == null) ? true : false;

    adminWorkout = sportsWorkoutModelForEdit.adminWorkout;

    descriptionWorkoutListFromCreatePage =
        sportsWorkoutModelForEdit.descriptionWorkoutList;

    idWorkout = sportsWorkoutModelForEdit.idWorkout;

    updateNameWorkout(
        newNameSportWorkout: sportsWorkoutModelForEdit.nameWorkout);

    update();
  }

  Future<void> updateEditWorkoutButtonTap(
      {required BuildContext context,
      required int indexInDataSportsWorkoutListWhenIAdmin}) async {
    try {
      //обновляю _sportWorkoutNewCreate для отправки данных и изменения
      await _updateAllDataInSportWorkoutNewCreate();

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
        //обновляем тренировку и в БД
        mySnackBarButton(
          context: context,
          title: "Тренировка обновлена",
          message: "",
        );

        await ImplementAppStateGetXController.instance
            .updateDataSportsWorkoutListWhenIAdmin(
                indexInDataSportsWorkoutListWhenIAdmin:
                    indexInDataSportsWorkoutListWhenIAdmin,
                sportWorkoutUpdate: _sportWorkoutNewCreate!);

        Get.close(0);
        clearAllDataInNewSportWorkout();
      }
    } catch (error) {
      print('error from _createWorkout $error');
    }
  }

  ///
}
