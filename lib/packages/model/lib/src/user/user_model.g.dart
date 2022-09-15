// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      idUser: json['idUser'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      age: json['age'] as int?,
      photoPath: json['photoPath'] as String?,
      family: json['family'] as String?,
      numberPhone: json['numberPhone'] as String?,
      listWorkoutKeys: (json['listWorkoutKeys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      listWorkoutKeysWheIAdmin:
          (json['listWorkoutKeysWheIAdmin'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet(),
      myFriends: (json['myFriends'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'idUser': instance.idUser,
      'name': instance.name,
      'email': instance.email,
      'age': instance.age,
      'photoPath': instance.photoPath,
      'family': instance.family,
      'numberPhone': instance.numberPhone,
      'listWorkoutKeys': instance.listWorkoutKeys?.toList(),
      'listWorkoutKeysWheIAdmin': instance.listWorkoutKeysWheIAdmin?.toList(),
      'myFriends': instance.myFriends?.toList(),
    };
