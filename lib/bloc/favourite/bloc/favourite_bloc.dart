import 'package:bloc/bloc.dart';
import 'package:blockprec/model/favourite_model.dart';
import 'package:blockprec/repositry/favourit_repo.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouritRepo favouritRepo;
  List<FavouriteItemModel> favouritlist = [];
  List<FavouriteItemModel> favouritItemlist = [];

  FavouriteBloc(this.favouritRepo) : super(FavouriteState()) {
    on<FavourititemEvent>(fatchList);
    on<FavourititemsEvent>(addItemList);
  }

  void fatchList(FavourititemEvent event, Emitter<FavouriteState> emit) async {
    favouritlist = await favouritRepo.fatchItem();

    emit(state.copyWith(
        favouritlist: List.from(favouritlist), listStatus: ListStatus.success));
  }

  void addItemList(
      FavourititemsEvent event, Emitter<FavouriteState> emit) async {
    // favouritItemlist =  favouritItemlist.add(event.item);

    final index =
        favouritlist.indexWhere((element) => element.id == event.item.id);

    favouritlist[index] = event.item;

    emit(state.copyWith(
        favouritlist: List.from(favouritlist), listStatus: ListStatus.success));
  }
}
