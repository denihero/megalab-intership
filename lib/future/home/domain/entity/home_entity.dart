class PostEntity {
  PostEntity({
    this.id,
    this.tag,
    this.title,
    this.text,
    this.image,
    this.is_liked,
    this.comment,
    this.shortDesc,
    this.author,
  });

  final int? id;
  final String? tag;
  final String? title;
  final String? text;
  final String? image;
  final bool? is_liked;
  final List<CommentEntity?>? comment;
  final String? shortDesc;
  final String? author;
}

class CommentEntity {
  CommentEntity({
    this.id,
    this.user,
    this.text,
    this.child,
  });

  final int? id;
  final UserEntity? user;
  final String? text;
  final List<CommentEntity?>? child;
}

class UserEntity {
  UserEntity({
    this.id,
    this.nickname,
    this.name,
    this.last_name,
    this.profile_image,
  });

  final int? id;
  final String? nickname;
  final String? name;
  final String? last_name;
  final String? profile_image;

}
