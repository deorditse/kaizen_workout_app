// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      idUser: json['idUser'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      photoPath: json['photoPath'] as String?,
      age: json['age'] as int?,
      family: json['family'] as String?,
      numberPhone: json['numberPhone'] as String?,
      listWorkout: (json['listWorkout'] as List<dynamic>?)
          ?.map((e) => SportsWorkoutModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
      listWorkoutWheIAdmin: (json['listWorkoutWheIAdmin'] as List<dynamic>?)
          ?.map((e) => SportsWorkoutModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
      myFriends: (json['myFriends'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'idUser': instance.idUser,
      'name': instance.name,
      'age': instance.age,
      'family': instance.family,
      'email': instance.email,
      'photoPath': instance.photoPath,
      'numberPhone': instance.numberPhone,
      'myFriends': instance.myFriends?.map((e) => e.toJson()).toList(),
      'listWorkout': instance.listWorkout?.map((e) => e.toJson()).toList(),
      'listWorkoutWheIAdmin':
          instance.listWorkoutWheIAdmin?.map((e) => e.toJson()).toList(),
    };
