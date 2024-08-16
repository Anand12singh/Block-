import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoState()) {
    on<AddToDoEvents>(addToDo);
    on<RemoveToDoEvents>(removeToDo);
  }
  late List<String> todolistAdd = [];

  void addToDo(AddToDoEvents event, Emitter<ToDoState> emit) {
    todolistAdd.add(event.task!);

    emit(state.copyWith(tolist: List.from(todolistAdd)));
  }

  void removeToDo(RemoveToDoEvents event, Emitter<ToDoState> emit) {
    todolistAdd.remove(event.task);

    emit(state.copyWith(tolist: List.from(todolistAdd)));
  }
}
