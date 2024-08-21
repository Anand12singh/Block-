import 'package:bloc/bloc.dart';
import 'package:blockprec/model/post_model.dart';
import 'package:blockprec/repositry/post_repo.dart';
import 'package:blockprec/utils/enums.dart';
import 'package:equatable/equatable.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepo postRepo = PostRepo();
  List<PostModel> searchpostList = [];

  PostBloc() : super(PostState()) {
    on<PostFetch>(fatchdata);
    on<SearchItem>(_searchList);
  }
  void fatchdata(PostFetch event, Emitter<PostState> emit) async {
    await postRepo.fetchPosts().then(
      (value) {
        emit(state.copyWith(
            message: '', postStatus: PostStatus.success, postList: value));
      },
    ).onError(
      (error, stackTrace) {
        print("error:$error");
        print(stackTrace);
        emit(
            state.copyWith(message: '$error', postStatus: PostStatus.faillure));
      },
    );
  }

  void _searchList(SearchItem event, Emitter<PostState> emit) {
    if (event.searchItem.isEmpty) {
      emit(state.copyWith(searchpostList: [], searchmessage: ''));
    } else {
      searchpostList = state.postList
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(event.searchItem.toString().toLowerCase()))
          .toList();

      if (searchpostList.isEmpty) {
        emit(state.copyWith(
            searchpostList: searchpostList, searchmessage: "Data Not Found"));
      } else {
        emit(state.copyWith(searchpostList: searchpostList, searchmessage: ''));
      }
    }
  }
}
