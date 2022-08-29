import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:model/src/user/name_and_photo_user/name_and_photo_user.dart';
import '../../model.dart';

part 'sports_workout_model.g.dart';

part 'sports_workout_model.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
//реализация c использванием пакета freezed чтобы не переопределять методы вручную, чтобы класы сравнивались не по ссылкам, а по значениям
//для запуска кодогенерации в текущем пакете flutter pub run build_runner build --delete-conflicting-outputs
//реализация c использванием пакета freezed чтобы не переопределять методы вручную, чтобы класы сравнивались не по ссылкам, а по значениям #для переопределения методов toString copyWith

@freezed
class SportsWorkoutModel with _$SportsWorkoutModel {
  factory SportsWorkoutModel({
    required String idWorkout,
    required NameAndPhotoUser adminWorkout,
    required String nameWorkout,
    Set<NameAndPhotoUser>? usersInWorkout,
    //лист с программой на каждый день
    required List<String> descriptionWorkoutList,
    required DateTime? firstWorkoutDay,
    DateTime? lastWorkoutDay,
    Set<NameAndPhotoUser>? topUsers,
  }) = _SportsWorkoutModel;

  factory SportsWorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$SportsWorkoutModelFromJson(json);
}

// @JsonSerializable
// @JsonSerializable(explicitToJson: true)
// //explicitToJson - чтобы получать конвертацию в json а не Instance этого класса
// class SportsWorkoutModel {
//   int idWorkout;
//   User adminWorkout;
//   String nameWorkout;
//   Set<User>? usersInWorkout = {};
//   List<String> descriptionWorkoutList = []; //лист с программой на каждый день
//   DateTime? firstWorkoutDay;
//   DateTime? lastWorkoutDay;
//   Set<User>? topUsers = {};
//
//   SportsWorkoutModel({
//     required this.idWorkout,
//     required this.nameWorkout,
//     this.usersInWorkout,
//     required this.descriptionWorkoutList,
//     required this.firstWorkoutDay,
//     this.topUsers,
//     required this.adminWorkout,
//   });
//
//   factory SportsWorkoutModel.fromJson(Map<String, dynamic> json) =>
//       _$SportsWorkoutModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SportsWorkoutModelToJson(this);
// }
