part of 'to_do_bloc.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class AddToDoEvents extends ToDoEvent {
  String? task;
  AddToDoEvents({required this.task});

  @override
  List<Object> get props => [task!];
}

class RemoveToDoEvents extends ToDoEvent {
  Object task;
  RemoveToDoEvents({required this.task});

  @override
  List<Object> get props => [];
}
