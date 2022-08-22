import 'package:json_annotation/json_annotation.dart';
import '../../model.dart';

part 'sports_workout_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
//реализация c использванием пакета freezed чтобы не переопределять методы вручную, чтобы класы сравнивались не по ссылкам, а по значениям
//для запуска кодогенерации в текущем пакете flutter pub run build_runner build --delete-conflicting-outputs
//реализация c использванием пакета freezed чтобы не переопределять методы вручную, чтобы класы сравнивались не по ссылкам, а по значениям #для переопределения методов toString copyWith

// @JsonSerializable
@JsonSerializable(explicitToJson: true)
//explicitToJson - чтобы получать конвертацию в json а не Instance этого класса
class SportsWorkoutModel {
  int idWorkout;
  User adminWorkout;
  String nameWorkout;
  Set<User>? usersInWorkout = {};
  List<String> descriptionWorkoutList = []; //лист с программой на каждый день
  DateTime? firstWorkoutDay;
  DateTime? lastWorkoutDay;
  Set<User>? topUsers = {};

  SportsWorkoutModel({
    required this.idWorkout,
    required this.nameWorkout,
    this.usersInWorkout,
    required this.descriptionWorkoutList,
    required this.firstWorkoutDay,
    this.topUsers,
    required this.adminWorkout,
  });

  factory SportsWorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$SportsWorkoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$SportsWorkoutModelToJson(this);
}
