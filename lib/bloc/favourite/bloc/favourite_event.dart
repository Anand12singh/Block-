part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FavourititemEvent extends FavouriteEvent {}

class FavourititemsEvent extends FavouriteEvent {
  final FavouriteItemModel item;
  const FavourititemsEvent({required this.item});

  @override
  List<Object> get props => [item];
}
