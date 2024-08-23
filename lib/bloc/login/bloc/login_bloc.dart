import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailAddress>((event, emit) {

    });
  }

  void emailchange(EmailAddress evant ,Emitter<LoginState>emit){
    // emit();

  }
}
