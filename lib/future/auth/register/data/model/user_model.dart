import 'package:mega_intern/future/auth/register/domain/entity/register_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class RegisterModel extends RegisterEntity with _$RegisterModel {
  const factory RegisterModel(
      {int? id,
      String? name,
      String? last_name,
      String? profile_image,
      String? username}) = _UserModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
