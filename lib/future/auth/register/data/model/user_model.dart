import 'package:mega_intern/future/auth/register/domain/entity/register_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// ignore: invalid_annotation_target
@freezed
class RegisterModel extends RegisterEntity with _$RegisterModel {
  const factory RegisterModel(
      {int? id,
      String? name,
      // ignore: invalid_annotation_target
      @JsonKey(name: 'last_name') String? lastName,
      // ignore: invalid_annotation_target
      @JsonKey(name: 'profile_image') String? profileImage,
      String? username}) = _UserModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
