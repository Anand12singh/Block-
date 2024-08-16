import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(enableordisablenotification);
    on<SliderEvent>(slidere);
  }
  void enableordisablenotification(
      EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isswitch: !state.isswitch));
  }

  void slidere(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.slider));
  }
}
