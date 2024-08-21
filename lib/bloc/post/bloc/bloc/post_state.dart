part of 'post_bloc.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> searchpostList;

  String message;
  String searchmessage;

  PostState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostModel>[],
      this.message = '',
      this.searchmessage = '',
      this.searchpostList = const <PostModel>[]});

  PostState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
    String? searchmessage,
    List<PostModel>? searchpostList,
  }) {
    return PostState(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        message: message ?? this.message,
        searchmessage: searchmessage ?? this.searchmessage,
        searchpostList: searchpostList ?? this.searchpostList);
  }

  @override
  List<Object> get props =>
      [postStatus, postList, message, searchpostList, searchmessage];
}
