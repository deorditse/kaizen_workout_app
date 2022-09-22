import 'package:model/model.dart';

class DataListRepository {
  Future<User> userData({required String idUser}) async {
    //имитация задержки получения данных из базы
    return await Future.delayed(Duration(seconds: 1)).then(
      (_) => const User(
        idUser: 'test id ___ test',
        name: 'Дмитрий',
        email: 'deorditse.d@yandex.ru',
        photoPath: 'assets/images/photo_test_user.png',
        age: 25,
        family: 'Деордице',
        numberPhone: '89252776324',
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
            name: 'Василий',
            photoPath: 'assets/images/user_test_1.jpeg',
            family: 'Олейников $index',
          ),
          usersInWorkout: <NameAndPhotoUser>{
            NameAndPhotoUser(
              idUser: 'test/gNe2AwjMJMVJ8OLvFu1T',
              name: 'Артемка}',
              photoPath: null,
              family: 'Бесфамильный ${index}',
            ),
            NameAndPhotoUser(
              idUser: 'test/mEFChkM5ME0WhJljfurm',
              name: 'Никитич }',
              photoPath: 'assets/images/user_test_2.jpeg',
              family: 'Азаров }',
            ),
            NameAndPhotoUser(
              idUser: 'test id admin',
              name: 'Игнат ',
              photoPath: 'assets/images/user_test_3.jpeg',
              family: 'Аськин $index',
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
              name: 'Иван',
              photoPath: 'assets/images/user_test_4.jpeg',
              family: 'Топюзерович $index',
            ),
          },
        );
      }),
    );
  }
}
