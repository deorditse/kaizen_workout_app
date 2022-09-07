// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sports_workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SportsWorkoutModel _$$_SportsWorkoutModelFromJson(
        Map<String, dynamic> json) =>
    _$_SportsWorkoutModel(
      idWorkout: json['idWorkout'] as String,
      adminWorkout: NameAndPhotoUser.fromJson(
          json['adminWorkout'] as Map<String, dynamic>),
      nameWorkout: json['nameWorkout'] as String,
      usersInWorkout: (json['usersInWorkout'] as List<dynamic>?)
          ?.map((e) => NameAndPhotoUser.fromJson(e as Map<String, dynamic>))
          .toSet(),
      descriptionWorkoutList: (json['descriptionWorkoutList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      firstWorkoutDay: DateTime.parse(json['firstWorkoutDay'] as String),
      lastWorkoutDay: json['lastWorkoutDay'] == null
          ? null
          : DateTime.parse(json['lastWorkoutDay'] as String),
      topUsers: (json['topUsers'] as List<dynamic>?)
          ?.map((e) => NameAndPhotoUser.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$$_SportsWorkoutModelToJson(
        _$_SportsWorkoutModel instance) =>
    <String, dynamic>{
      'idWorkout': instance.idWorkout,
      'adminWorkout': instance.adminWorkout,
      'nameWorkout': instance.nameWorkout,
      'usersInWorkout': instance.usersInWorkout?.toList(),
      'descriptionWorkoutList': instance.descriptionWorkoutList,
      'firstWorkoutDay': instance.firstWorkoutDay.toIso8601String(),
      'lastWorkoutDay': instance.lastWorkoutDay?.toIso8601String(),
      'topUsers': instance.topUsers?.toList(),
    };
