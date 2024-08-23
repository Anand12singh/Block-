part of 'login_bloc.dart';

enum LoginStatus { intial, loading, success, error }

class LoginState extends Equatable {
  const LoginState(
      {this.email = '',
      this.passsward = '',
      this.message = '',
      this.loginStatus = LoginStatus.intial});

  final String email;
  final String passsward;
  final String message;

  final LoginStatus loginStatus;

  LoginState copyWith(
      {String? email,
      String? passsward,
      String? message,
      final LoginStatus? loginStatus}) {
    return LoginState(
        email: email ?? this.email,
        passsward: passsward ?? this.passsward,
        message: message ?? this.message,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object> get props => [email, passsward, message, loginStatus];
}
