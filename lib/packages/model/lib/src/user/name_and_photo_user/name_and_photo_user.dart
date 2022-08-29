import 'package:json_annotation/json_annotation.dart';

part 'name_and_photo_user.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable(explicitToJson: true)
// //explicitToJson - чтобы получать конвертацию в json а не Instance этого класса
class NameAndPhotoUser {
  String idUser;
  String name = 'Anonymous';
  String? family = '';
  String? photoPath;

  NameAndPhotoUser({
    required this.idUser,
    required this.name,
    required this.photoPath,
    required this.family,
  });

  //для упращенного получения данных, чтобы не получать всего пользователя целиком, а когда он нужен - получать отдельно как модель User
  factory NameAndPhotoUser.fromJson(Map<String, dynamic> json) =>
      _$NameAndPhotoUserFromJson(json);

  Map<String, dynamic> toJson() => _$NameAndPhotoUserToJson(this);
}
