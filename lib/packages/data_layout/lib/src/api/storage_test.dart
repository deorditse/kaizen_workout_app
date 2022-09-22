import 'dart:math';

import 'package:model/model.dart';

class DataListRepository {
  Future<User> userData({required String idUser}) async {
    //имитация задержки получения данных из базы
    return await Future.delayed(Duration(seconds: 2)).then(
      (_) => const User(
        idUser: 'test id ___ test',
        name: 'Test name ',
        email: 'email',
        photoPath: 'photoPath',
        age: 123,
        family: 'family',
        numberPhone: 'numberPhone',
        listWorkoutKeys: {
          '4000',
          '4001',
          '4002',
          '4003',
        },
        listWorkoutKeysWheIAdmin: {
          '4003',
        },
        //для примера
      ),
    );
  }

  //получение тренировки по ключу из теста
  Future<SportsWorkoutModel?> getDataSportWorkout(
      {required String idWorkout}) async {
    List<SportsWorkoutModel> sportsWorkoutList = await _sportsWorkoutList();
    SportsWorkoutModel? res;

    for (var sportWorkout in sportsWorkoutList) {
      if (sportWorkout.idWorkout == idWorkout) {
        res = sportWorkout;
        break; //выходим из цикла
      }
    }

    return res;
  }

  Future<List<SportsWorkoutModel>> _sportsWorkoutList() async {
    return await Future.delayed(Duration(seconds: 2)).then(
      (_) => List<SportsWorkoutModel>.generate(5, (index) {
        return SportsWorkoutModel(
          idWorkout: '${4000 + index}',
          nameWorkout: 'Отжимания каждый день $index',
          adminWorkout: NameAndPhotoUser(
            idUser: 'test id admin',
            name: 'adminWorkout  $index',
            photoPath: 'photoPath $index',
            family: 'family $index',
          ),
          usersInWorkout: <NameAndPhotoUser>{
            NameAndPhotoUser(
              idUser: 'test/gNe2AwjMJMVJ8OLvFu1T',
              name: 'user 1 name ${index + index * 3}',
              photoPath: 'photoPath ${index * index}',
              family: 'family ${index + index * 3}',
            ),
            NameAndPhotoUser(
              idUser: 'test/mEFChkM5ME0WhJljfurm',
              name: 'user 2 name ${index * index}',
              photoPath: 'photoPath ${index + index}',
              family: 'family ${index + index}',
            ),
            NameAndPhotoUser(
              idUser: 'test id admin',
              name: 'adminWorkout  $index',
              photoPath: 'photoPath $index',
              family: 'family $index',
            ),
          },
          descriptionWorkoutList: [
            'отжимания каждый день $index',
            'тринировка ${index + 1}',
            'тринировка ${index + 2}',
            'тринировка ${index + 3}',
          ],
          firstWorkoutDay: DateTime(2022, 9, index + 2),
          // lastWorkoutDay: DateTime(2022, 9, index + 5),
          topUsers: <NameAndPhotoUser>{
            NameAndPhotoUser(
              idUser: 'test id',
              name: 'name $index',
              photoPath: 'photoPath $index',
              family: 'family $index',
            ),
          },
        );
      }),
    );
  }
}
