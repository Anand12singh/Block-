part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  List<FavouriteItemModel> favouritlist;
  ListStatus listStatus;
  FavouriteState(
      {this.favouritlist = const [], this.listStatus = ListStatus.loading});

  @override
  List<Object> get props => [favouritlist, listStatus];

  FavouriteState copyWith(
      {List<FavouriteItemModel>? favouritlist, ListStatus? listStatus}) {
    return FavouriteState(
        favouritlist: favouritlist ?? this.favouritlist,
        listStatus: listStatus ?? this.listStatus);
  }
}
