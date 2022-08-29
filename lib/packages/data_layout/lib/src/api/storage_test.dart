import 'dart:math';

import 'package:model/model.dart';

class DataListRepository {
  Future<User> userData({required String idUser}) async {
    //имитация задержки получения данных из базы
    return await Future.delayed(Duration(seconds: 2)).then(
      (_) => User(
        idUser: idUser,
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
          idWorkout: 'test 33PhNVsd2XI5vVq37A2l',
          nameWorkout: 'Отжимания каждый день $index',
          usersInWorkout: <NameAndPhotoUser>{
            NameAndPhotoUser(
              idUser: 'test gNe2AwjMJMVJ8OLvFu1T',
              name: 'user 1 name ${index + index * 3}',
              photoPath: 'photoPath ${index * index}',
              family: 'family ${index + index * 3}',
            ),
            NameAndPhotoUser(
              idUser: 'test mEFChkM5ME0WhJljfurm',
              name: 'user 2 name ${index * index}',
              photoPath: 'photoPath ${index + index}',
              family: 'family ${index + index}',
            ),
          },
          descriptionWorkoutList: [
            'chekWorkoutList $index, chekWorkoutList $index, chekWorkoutList $index, chekWorkoutList $index',
          ],
          firstWorkoutDay: DateTime.now(),
          topUsers: <NameAndPhotoUser>{
            NameAndPhotoUser(
              idUser: 'test id',
              name: 'name $index',
              photoPath: 'photoPath $index',
              family: 'family $index',
            ),
          },
          adminWorkout: NameAndPhotoUser(
            idUser: 'test id admin',
            name: 'adminWorkout  $index',
            photoPath: 'photoPath $index',
            family: 'family $index',
          ),
        ),
      ),
    );
  }
}
