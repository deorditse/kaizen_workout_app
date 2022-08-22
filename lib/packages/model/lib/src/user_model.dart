import 'package:json_annotation/json_annotation.dart';
import 'package:model/src/sports_page/sports_workout_model.dart';

part 'user_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
//реализация c использванием пакета freezed чтобы не переопределять методы вручную, чтобы класы сравнивались не по ссылкам, а по значениям
//для запуска кодогенерации в текущем пакете flutter pub run build_runner build --delete-conflicting-outputs
//реализация c использванием пакета freezed чтобы не переопределять методы вручную, чтобы класы сравнивались не по ссылкам, а по значениям #для переопределения методов toString copyWith
@JsonSerializable(explicitToJson: true)
//explicitToJson - чтобы получать конвертацию в json а не Instance этого класса
class User {
  int idUser;
  String name = 'user';
  int? age;
  String? family = '';
  String email = 'нет email';
  String? photoPath;
  String? numberPhone;
  Set<User>? myFriends = {}; //кто у него в друзьях
  Set<SportsWorkoutModel>? listWorkout = {}; //тренировки добавленные по ключу
  Set<SportsWorkoutModel>? listWorkoutWheIAdmin = {}; //тренировки созданные мною

  // List<Widget> listProgress = [];

  User({
    required this.idUser,
    required this.name,
    required this.email,
    required this.photoPath,
    required this.age,
    required this.family,
    required this.numberPhone,
    this.listWorkout,
    this.listWorkoutWheIAdmin,
    this.myFriends,
    // required this.listProgress,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
