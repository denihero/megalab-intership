// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      last_name: json['last_name'] as String?,
      profile_image: json['profile_image'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.last_name,
      'profile_image': instance.profile_image,
      'username': instance.username,
    };
