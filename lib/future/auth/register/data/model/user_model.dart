import 'package:mega_intern/future/auth/register/domain/entity/auth_entity.dart';


import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends UserEntity with _$UserModel{
  const factory UserModel({int? id, String? name,String? last_name,String? profile_image,String? username}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}