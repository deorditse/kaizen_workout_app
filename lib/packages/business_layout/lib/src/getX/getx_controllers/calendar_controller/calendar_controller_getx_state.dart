import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

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
      print(error);
    }
  }

  void updateTaskForTheDay({required indexDay, required String value}) {
    try {
      // sportWorkoutNewCreate.descriptionWorkoutList.elementAt(indexDay) == value;
      descriptionWorkoutList[indexDay] = value;
      update();

      if (indexDay == 0) {
        descriptionWorkoutList =
            List.generate(itemCount ?? 100, (index) => value);
        update();
      }
    } catch (e) {
      print('ошибка из updateTaskForTheDay ${e}');
    }
  }

  String? taskForTheDay({required int indexDay}) {
    try {
      if (descriptionWorkoutList[indexDay] != null &&
          descriptionWorkoutList[indexDay]!.isNotEmpty) {
        return descriptionWorkoutList[indexDay];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  void _createDescriptionWorkoutList() {
    descriptionWorkoutList = List.generate(itemCount ?? 100, (_) => null);
    update();
  }

  void createSportWorkoutButtonTap() {
    sportWorkoutNewCreate = sportWorkoutNewCreate.copyWith(
        descriptionWorkoutList: descriptionWorkoutList);
    update();
  }
}
