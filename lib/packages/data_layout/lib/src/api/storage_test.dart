import 'dart:math';

import 'package:model/model.dart';

class DataListRepository {
  Future<User> userData() async {
    //имитация задержки получения данных из базы
    return await Future.delayed(Duration(seconds: 2)).then(
      (_) => User(
        idUser: Random().nextInt(4300),
        name: 'Test name ',
        email: 'email',
        photoPath: 'photoPath',
        age: 123,
        family: 'family',
        numberPhone: 'numberPhone',
        listWorkoutKeys: {'1', '2', '3'},
        listWorkoutKeysWheIAdmin: {'1'},
        //для примера
      ),
    );
  }

  //получение тренировки по ключу
  Future<SportsWorkoutModel?> getDataSportWorkout(
      {required int idWorkout}) async {
    List<SportsWorkoutModel> sportsWorkoutList = await _sportsWorkoutList();
    SportsWorkoutModel? res;
    for (var element in sportsWorkoutList) {
      if (element.idWorkout == idWorkout) {
        res = element;
        break; //выходим из цикла
      }
    }
    return res;
  }

  Future<List<SportsWorkoutModel>> _sportsWorkoutList() async {
    return await Future.delayed(Duration(seconds: 2)).then(
      (_) => List<SportsWorkoutModel>.generate(
        5,
        (index) => SportsWorkoutModel(
          idWorkout: index + 1,
          nameWorkout: 'Отжимания каждый день $index',
          usersInWorkout: <User>{
            User(
              idUser: index * index,
              name: 'user 1 name ${index + index * 3}',
              email: 'email ${index * index}',
              photoPath: 'photoPath ${index * index}',
              age: index * index + 20,
              family: 'family ${index + index * 3}',
              numberPhone: 'numberPhone ${index * index}',
            ),
            User(
              idUser: index + 2 * index,
              name: 'user 2 name ${index * index}',
              email: 'email ${index * index}',
              photoPath: 'photoPath ${index + index}',
              age: index * index + 20,
              family: 'family ${index + index}',
              numberPhone: 'numberPhone ${index * index}',
            ),
          },
          descriptionWorkoutList: [
            'chekWorkoutList $index, chekWorkoutList $index, chekWorkoutList $index, chekWorkoutList $index',
          ],
          firstWorkoutDay: DateTime.now(),
          topUsers: <User>{
            User(
              idUser: index,
              name: 'name $index',
              email: 'email $index',
              photoPath: 'photoPath $index',
              age: index + 20,
              family: 'family $index',
              numberPhone: 'numberPhone $index',
            ),
          },
          adminWorkout: User(
            idUser: index,
            name: 'adminWorkout  $index',
            email: 'email $index',
            photoPath: 'photoPath $index',
            age: index + 10,
            family: 'family $index',
            numberPhone: 'numberPhone $index',
          ),
        ),
      ),
    );
  }
}
