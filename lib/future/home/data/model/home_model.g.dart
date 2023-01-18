// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeModel _$$_HomeModelFromJson(Map<String, dynamic> json) => _$_HomeModel(
      id: json['id'] as int?,
      tag: json['tag'] as String?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      image: json['image'] as String?,
      is_liked: json['is_liked'] as bool?,
      comment: (json['comment'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortDesc: json['shortDesc'] as String?,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$$_HomeModelToJson(_$_HomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'title': instance.title,
      'text': instance.text,
      'image': instance.image,
      'is_liked': instance.is_liked,
      'comment': instance.comment,
      'shortDesc': instance.shortDesc,
      'author': instance.author,
    };

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      text: json['text'] as String?,
      child: (json['child'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'text': instance.text,
      'child': instance.child,
    };

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int?,
      nickname: json['nickname'] as String?,
      name: json['name'] as String?,
      last_name: json['last_name'] as String?,
      profile_image: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'name': instance.name,
      'last_name': instance.last_name,
      'profile_image': instance.profile_image,
    };

_$_TagModel _$$_TagModelFromJson(Map<String, dynamic> json) => _$_TagModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_TagModelToJson(_$_TagModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
