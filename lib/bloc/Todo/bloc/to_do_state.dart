part of 'to_do_bloc.dart';

class ToDoState extends Equatable {
  final List<String?> tolist;
  const ToDoState({this.tolist = const []});

  ToDoState copyWith({List<String>? tolist}) {
    return ToDoState(tolist: tolist ?? this.tolist);
  }

  @override
  List<Object> get props => [tolist];
}
