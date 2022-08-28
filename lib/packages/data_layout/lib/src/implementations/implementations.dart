import 'package:model/model.dart';
import '../api/storage_test.dart';

class ImplementationSportsWorkoutDataServices {
//получаем данные пользователя
  Future<User> getDataUser() async => await DataListRepository().userData();

  //нужно будет выводить по ключам, которые получил от юзера
  Future<SportsWorkoutModel?> getDataSportWorkout(
      {required int idWorkout}) async {
    return await DataListRepository().getDataSportWorkout(idWorkout: idWorkout);
  }
}
