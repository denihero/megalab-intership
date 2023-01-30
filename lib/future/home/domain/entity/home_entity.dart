class PostEntity {
  PostEntity({
    this.id,
    this.tag,
    this.title,
    this.text,
    this.image,
    this.isLiked,
    this.comment,
    this.shortDesc,
    this.author,
  });

  final int? id;
  final String? tag;
  final String? title;
  final String? text;
  final String? image;
  final bool? isLiked;
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
    this.lastName,
    this.profileImage,
  });

  final int? id;
  final String? nickname;
  final String? name;
  final String? lastName;
  final String? profileImage;
}

class TagEntity {
  TagEntity(this.id, this.name);

  final int? id;
  final String? name;
}
