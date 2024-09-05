import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailAddress>(emailchange);
    on<Passsward>(passswardChange);
    on<LoginApiEvent>(loginApi);
  }

  void emailchange(EmailAddress evant, Emitter<LoginState> emit) {
    emit(state.copyWith(email: evant.email));
  }

  void passswardChange(Passsward evant, Emitter<LoginState> emit) {
    emit(state.copyWith(passsward: evant.passsward));
  }

  void loginApi(LoginApiEvent evant, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.intial, message: ''));
    Map data = {"email": state.email, "password": state.passsward};
    print("data: $data");
    try {
      final response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: data);

      var datas = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('successfully');
        emit(state.copyWith(loginStatus: LoginStatus.success, message: ''));
      } else {
        print(response.statusCode);
        emit(state.copyWith(
            loginStatus: LoginStatus.error, message: datas['error']));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString()));

      log('$e');
    }
  }
}
