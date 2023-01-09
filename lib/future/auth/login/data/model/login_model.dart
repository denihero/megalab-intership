
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mega_intern/future/auth/login/domain/entity/token_entity.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel extends LoginEntity with _$LoginModel {
  factory LoginModel({String? token}) = _TokenModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}