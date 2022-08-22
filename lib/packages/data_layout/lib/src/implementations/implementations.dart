import 'package:model/model.dart';
import '../api/storage_test.dart';

class ImplementationSportsWorkoutDataServices {
  Future<List<SportsWorkoutModel>> getDataSportsWorkout() async =>
      await DataListRepository().listSportsWorkout();

  Future<User> getUserData() async => await DataListRepository().userData();
}
