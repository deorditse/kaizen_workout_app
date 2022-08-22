import 'dart:math';

import 'package:model/model.dart';

class DataListRepository {
  Future<User> userData() async {
    return await listSportsWorkout().then(
      (listSportsWorkout) async => User(
        idUser: Random().nextInt(4300),
        name: 'Test name ',
        email: 'email',
        photoPath: 'photoPath',
        age: 123,
        family: 'family',
        numberPhone: 'numberPhone',
        listWorkout: listSportsWorkout.toSet(),
        listWorkoutWheIAdmin: {
          listSportsWorkout.first,
        }, //для примера
      ),
    );
  }

  Future<List<SportsWorkoutModel>> listSportsWorkout() async {
    ///имитация работы с сетью
    await Future.delayed(const Duration(seconds: 1));
    return _sportsWorkoutList; //as Set<SportsWorkoutModel>;
  }

  final List<SportsWorkoutModel> _sportsWorkoutList =
      List<SportsWorkoutModel>.generate(
    3,
    (index) => SportsWorkoutModel(
      idWorkout: 1110 + index,
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
  );
}
