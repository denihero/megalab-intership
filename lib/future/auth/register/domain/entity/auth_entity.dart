import 'package:equatable/equatable.dart';


class UserEntity{
  final int? id;
  final String? name;
  final String? username;
  final String? last_name;
  final String? profile_image;

  const UserEntity(
      {this.id,
      this.name,
      this.last_name,
      this.profile_image,
      this.username});


}
