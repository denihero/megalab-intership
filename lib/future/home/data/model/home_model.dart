import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mega_intern/future/home/domain/entity/home_entity.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class PostModel extends PostEntity with _$PostModel{
  const factory PostModel({
    int? id,
    String? tag,
    String? title,
    String? text,
    String? image,
    bool? is_liked,
    List<CommentModel?>? comment,
    String? shortDesc,
    String? author,
  }) = _HomeModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}

@freezed
class CommentModel extends CommentEntity with _$CommentModel {
  const factory CommentModel({
    int? id,
    UserModel? user,
    String? text,
    List<CommentModel?>? child,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}

@freezed
class UserModel extends UserEntity with _$UserModel {
  const factory UserModel({
    int? id,
    String? nickname,
    String? name,
    String? last_name,
    String? profile_image,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}