// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_and_photo_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameAndPhotoUser _$NameAndPhotoUserFromJson(Map<String, dynamic> json) =>
    NameAndPhotoUser(
      idUser: json['idUser'] as String,
      name: json['name'] as String,
      photoPath: json['photoPath'] as String?,
      family: json['family'] as String?,
    );

Map<String, dynamic> _$NameAndPhotoUserToJson(NameAndPhotoUser instance) =>
    <String, dynamic>{
      'idUser': instance.idUser,
      'name': instance.name,
      'family': instance.family,
      'photoPath': instance.photoPath,
    };
