import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  int counter;
  CounterState({this.counter = 0});

  //change or override instance;
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  List<Object?> get props => [counter];
}
