import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mega_intern/future/home/domain/entity/home_entity.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
class PostModel extends PostEntity with _$PostModel {
  const factory PostModel({
    int? id,
    String? tag,
    String? title,
    String? text,
    String? image,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'is_liked') bool? isLiked,
    List<CommentModel?>? comment,
    String? shortDesc,
    String? author,
  }) = _HomeModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

@freezed
class CommentModel extends CommentEntity with _$CommentModel {
  const factory CommentModel({
    int? id,
    UserModel? user,
    String? text,
    List<CommentModel?>? child,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

@freezed
class UserModel extends UserEntity with _$UserModel {
  const factory UserModel({
    int? id,
    String? nickname,
    String? name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'last_name') String? lastName,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'profile_image') String? profileImage,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class TagModel extends TagEntity with _$TagModel {
  const factory TagModel({int? id, String? name}) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
}
