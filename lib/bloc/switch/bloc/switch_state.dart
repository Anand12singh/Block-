part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  bool isswitch;
  double slider;
  SwitchState({this.isswitch = true, this.slider = 1.0});

  SwitchState copyWith({bool? isswitch, double? slider}) {
    return SwitchState(
        isswitch: isswitch ?? this.isswitch, slider: slider ?? this.slider);
  }

  @override
  List<Object> get props => [isswitch, slider];
}

// final class SwitchInitial extends SwitchState {}
