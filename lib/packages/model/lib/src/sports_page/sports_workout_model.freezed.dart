// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sports_workout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SportsWorkoutModel _$SportsWorkoutModelFromJson(Map<String, dynamic> json) {
  return _SportsWorkoutModel.fromJson(json);
}

/// @nodoc
mixin _$SportsWorkoutModel {
  String get idWorkout => throw _privateConstructorUsedError;
  NameAndPhotoUser get adminWorkout => throw _privateConstructorUsedError;
  String get nameWorkout => throw _privateConstructorUsedError;
  Set<NameAndPhotoUser>? get usersInWorkout =>
      throw _privateConstructorUsedError; //лист с программой на каждый день
  List<String?> get descriptionWorkoutList =>
      throw _privateConstructorUsedError;
  DateTime get firstWorkoutDay => throw _privateConstructorUsedError;
  DateTime? get lastWorkoutDay => throw _privateConstructorUsedError;
  Set<NameAndPhotoUser>? get topUsers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SportsWorkoutModelCopyWith<SportsWorkoutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SportsWorkoutModelCopyWith<$Res> {
  factory $SportsWorkoutModelCopyWith(
          SportsWorkoutModel value, $Res Function(SportsWorkoutModel) then) =
      _$SportsWorkoutModelCopyWithImpl<$Res>;
  $Res call(
      {String idWorkout,
      NameAndPhotoUser adminWorkout,
      String nameWorkout,
      Set<NameAndPhotoUser>? usersInWorkout,
      List<String?> descriptionWorkoutList,
      DateTime firstWorkoutDay,
      DateTime? lastWorkoutDay,
      Set<NameAndPhotoUser>? topUsers});
}

/// @nodoc
class _$SportsWorkoutModelCopyWithImpl<$Res>
    implements $SportsWorkoutModelCopyWith<$Res> {
  _$SportsWorkoutModelCopyWithImpl(this._value, this._then);

  final SportsWorkoutModel _value;
  // ignore: unused_field
  final $Res Function(SportsWorkoutModel) _then;

  @override
  $Res call({
    Object? idWorkout = freezed,
    Object? adminWorkout = freezed,
    Object? nameWorkout = freezed,
    Object? usersInWorkout = freezed,
    Object? descriptionWorkoutList = freezed,
    Object? firstWorkoutDay = freezed,
    Object? lastWorkoutDay = freezed,
    Object? topUsers = freezed,
  }) {
    return _then(_value.copyWith(
      idWorkout: idWorkout == freezed
          ? _value.idWorkout
          : idWorkout // ignore: cast_nullable_to_non_nullable
              as String,
      adminWorkout: adminWorkout == freezed
          ? _value.adminWorkout
          : adminWorkout // ignore: cast_nullable_to_non_nullable
              as NameAndPhotoUser,
      nameWorkout: nameWorkout == freezed
          ? _value.nameWorkout
          : nameWorkout // ignore: cast_nullable_to_non_nullable
              as String,
      usersInWorkout: usersInWorkout == freezed
          ? _value.usersInWorkout
          : usersInWorkout // ignore: cast_nullable_to_non_nullable
              as Set<NameAndPhotoUser>?,
      descriptionWorkoutList: descriptionWorkoutList == freezed
          ? _value.descriptionWorkoutList
          : descriptionWorkoutList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      firstWorkoutDay: firstWorkoutDay == freezed
          ? _value.firstWorkoutDay
          : firstWorkoutDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastWorkoutDay: lastWorkoutDay == freezed
          ? _value.lastWorkoutDay
          : lastWorkoutDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topUsers: topUsers == freezed
          ? _value.topUsers
          : topUsers // ignore: cast_nullable_to_non_nullable
              as Set<NameAndPhotoUser>?,
    ));
  }
}

/// @nodoc
abstract class _$$_SportsWorkoutModelCopyWith<$Res>
    implements $SportsWorkoutModelCopyWith<$Res> {
  factory _$$_SportsWorkoutModelCopyWith(_$_SportsWorkoutModel value,
          $Res Function(_$_SportsWorkoutModel) then) =
      __$$_SportsWorkoutModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String idWorkout,
      NameAndPhotoUser adminWorkout,
      String nameWorkout,
      Set<NameAndPhotoUser>? usersInWorkout,
      List<String?> descriptionWorkoutList,
      DateTime firstWorkoutDay,
      DateTime? lastWorkoutDay,
      Set<NameAndPhotoUser>? topUsers});
}

/// @nodoc
class __$$_SportsWorkoutModelCopyWithImpl<$Res>
    extends _$SportsWorkoutModelCopyWithImpl<$Res>
    implements _$$_SportsWorkoutModelCopyWith<$Res> {
  __$$_SportsWorkoutModelCopyWithImpl(
      _$_SportsWorkoutModel _value, $Res Function(_$_SportsWorkoutModel) _then)
      : super(_value, (v) => _then(v as _$_SportsWorkoutModel));

  @override
  _$_SportsWorkoutModel get _value => super._value as _$_SportsWorkoutModel;

  @override
  $Res call({
    Object? idWorkout = freezed,
    Object? adminWorkout = freezed,
    Object? nameWorkout = freezed,
    Object? usersInWorkout = freezed,
    Object? descriptionWorkoutList = freezed,
    Object? firstWorkoutDay = freezed,
    Object? lastWorkoutDay = freezed,
    Object? topUsers = freezed,
  }) {
    return _then(_$_SportsWorkoutModel(
      idWorkout: idWorkout == freezed
          ? _value.idWorkout
          : idWorkout // ignore: cast_nullable_to_non_nullable
              as String,
      adminWorkout: adminWorkout == freezed
          ? _value.adminWorkout
          : adminWorkout // ignore: cast_nullable_to_non_nullable
              as NameAndPhotoUser,
      nameWorkout: nameWorkout == freezed
          ? _value.nameWorkout
          : nameWorkout // ignore: cast_nullable_to_non_nullable
              as String,
      usersInWorkout: usersInWorkout == freezed
          ? _value._usersInWorkout
          : usersInWorkout // ignore: cast_nullable_to_non_nullable
              as Set<NameAndPhotoUser>?,
      descriptionWorkoutList: descriptionWorkoutList == freezed
          ? _value._descriptionWorkoutList
          : descriptionWorkoutList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      firstWorkoutDay: firstWorkoutDay == freezed
          ? _value.firstWorkoutDay
          : firstWorkoutDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastWorkoutDay: lastWorkoutDay == freezed
          ? _value.lastWorkoutDay
          : lastWorkoutDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topUsers: topUsers == freezed
          ? _value._topUsers
          : topUsers // ignore: cast_nullable_to_non_nullable
              as Set<NameAndPhotoUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SportsWorkoutModel implements _SportsWorkoutModel {
  _$_SportsWorkoutModel(
      {required this.idWorkout,
      required this.adminWorkout,
      required this.nameWorkout,
      final Set<NameAndPhotoUser>? usersInWorkout,
      required final List<String?> descriptionWorkoutList,
      required this.firstWorkoutDay,
      this.lastWorkoutDay,
      final Set<NameAndPhotoUser>? topUsers})
      : _usersInWorkout = usersInWorkout,
        _descriptionWorkoutList = descriptionWorkoutList,
        _topUsers = topUsers;

  factory _$_SportsWorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$$_SportsWorkoutModelFromJson(json);

  @override
  final String idWorkout;
  @override
  final NameAndPhotoUser adminWorkout;
  @override
  final String nameWorkout;
  final Set<NameAndPhotoUser>? _usersInWorkout;
  @override
  Set<NameAndPhotoUser>? get usersInWorkout {
    final value = _usersInWorkout;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

//лист с программой на каждый день
  final List<String?> _descriptionWorkoutList;
//лист с программой на каждый день
  @override
  List<String?> get descriptionWorkoutList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_descriptionWorkoutList);
  }

  @override
  final DateTime firstWorkoutDay;
  @override
  final DateTime? lastWorkoutDay;
  final Set<NameAndPhotoUser>? _topUsers;
  @override
  Set<NameAndPhotoUser>? get topUsers {
    final value = _topUsers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  String toString() {
    return 'SportsWorkoutModel(idWorkout: $idWorkout, adminWorkout: $adminWorkout, nameWorkout: $nameWorkout, usersInWorkout: $usersInWorkout, descriptionWorkoutList: $descriptionWorkoutList, firstWorkoutDay: $firstWorkoutDay, lastWorkoutDay: $lastWorkoutDay, topUsers: $topUsers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SportsWorkoutModel &&
            const DeepCollectionEquality().equals(other.idWorkout, idWorkout) &&
            const DeepCollectionEquality()
                .equals(other.adminWorkout, adminWorkout) &&
            const DeepCollectionEquality()
                .equals(other.nameWorkout, nameWorkout) &&
            const DeepCollectionEquality()
                .equals(other._usersInWorkout, _usersInWorkout) &&
            const DeepCollectionEquality().equals(
                other._descriptionWorkoutList, _descriptionWorkoutList) &&
            const DeepCollectionEquality()
                .equals(other.firstWorkoutDay, firstWorkoutDay) &&
            const DeepCollectionEquality()
                .equals(other.lastWorkoutDay, lastWorkoutDay) &&
            const DeepCollectionEquality().equals(other._topUsers, _topUsers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(idWorkout),
      const DeepCollectionEquality().hash(adminWorkout),
      const DeepCollectionEquality().hash(nameWorkout),
      const DeepCollectionEquality().hash(_usersInWorkout),
      const DeepCollectionEquality().hash(_descriptionWorkoutList),
      const DeepCollectionEquality().hash(firstWorkoutDay),
      const DeepCollectionEquality().hash(lastWorkoutDay),
      const DeepCollectionEquality().hash(_topUsers));

  @JsonKey(ignore: true)
  @override
  _$$_SportsWorkoutModelCopyWith<_$_SportsWorkoutModel> get copyWith =>
      __$$_SportsWorkoutModelCopyWithImpl<_$_SportsWorkoutModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SportsWorkoutModelToJson(
      this,
    );
  }
}

abstract class _SportsWorkoutModel implements SportsWorkoutModel {
  factory _SportsWorkoutModel(
      {required final String idWorkout,
      required final NameAndPhotoUser adminWorkout,
      required final String nameWorkout,
      final Set<NameAndPhotoUser>? usersInWorkout,
      required final List<String?> descriptionWorkoutList,
      required final DateTime firstWorkoutDay,
      final DateTime? lastWorkoutDay,
      final Set<NameAndPhotoUser>? topUsers}) = _$_SportsWorkoutModel;

  factory _SportsWorkoutModel.fromJson(Map<String, dynamic> json) =
      _$_SportsWorkoutModel.fromJson;

  @override
  String get idWorkout;
  @override
  NameAndPhotoUser get adminWorkout;
  @override
  String get nameWorkout;
  @override
  Set<NameAndPhotoUser>? get usersInWorkout;
  @override //лист с программой на каждый день
  List<String?> get descriptionWorkoutList;
  @override
  DateTime get firstWorkoutDay;
  @override
  DateTime? get lastWorkoutDay;
  @override
  Set<NameAndPhotoUser>? get topUsers;
  @override
  @JsonKey(ignore: true)
  _$$_SportsWorkoutModelCopyWith<_$_SportsWorkoutModel> get copyWith =>
      throw _privateConstructorUsedError;
}
