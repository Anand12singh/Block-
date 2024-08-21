part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFetch extends PostEvent {}

class SearchItem extends PostEvent {
  final String searchItem;
  SearchItem({this.searchItem = ''});
  


}
