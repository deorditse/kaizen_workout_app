// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sports_workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SportsWorkoutModel _$SportsWorkoutModelFromJson(Map<String, dynamic> json) =>
    SportsWorkoutModel(
      idWorkout: json['idWorkout'] as int,
      nameWorkout: json['nameWorkout'] as String,
      usersInWorkout: (json['usersInWorkout'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet(),
      descriptionWorkoutList: (json['descriptionWorkoutList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      firstWorkoutDay: json['firstWorkoutDay'] == null
          ? null
          : DateTime.parse(json['firstWorkoutDay'] as String),
      topUsers: (json['topUsers'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet(),
      adminWorkout: User.fromJson(json['adminWorkout'] as Map<String, dynamic>),
    )..lastWorkoutDay = json['lastWorkoutDay'] == null
        ? null
        : DateTime.parse(json['lastWorkoutDay'] as String);

Map<String, dynamic> _$SportsWorkoutModelToJson(SportsWorkoutModel instance) =>
    <String, dynamic>{
      'idWorkout': instance.idWorkout,
      'adminWorkout': instance.adminWorkout.toJson(),
      'nameWorkout': instance.nameWorkout,
      'usersInWorkout':
          instance.usersInWorkout?.map((e) => e.toJson()).toList(),
      'descriptionWorkoutList': instance.descriptionWorkoutList,
      'firstWorkoutDay': instance.firstWorkoutDay?.toIso8601String(),
      'lastWorkoutDay': instance.lastWorkoutDay?.toIso8601String(),
      'topUsers': instance.topUsers?.map((e) => e.toJson()).toList(),
    };
