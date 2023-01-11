part of 'get_favourite_cubit.dart';

abstract class GetFavouriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFavouriteInitial extends GetFavouriteState {}

class GetFavouriteLoading extends GetFavouriteState {}

class GetFavouriteError extends GetFavouriteState {
  GetFavouriteError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

class GetFavouriteSuccess extends GetFavouriteState {
  GetFavouriteSuccess(this.fav);

  final List<PostModel> fav;

  @override
  List<Object?> get props => [fav];
}
