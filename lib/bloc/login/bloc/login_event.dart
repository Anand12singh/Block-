part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailAddress extends LoginEvent {
  EmailAddress({required this.email});

  String email;

  @override
  List<Object> get props => [email];
}

class Passsward extends LoginEvent {
  Passsward({required this.passsward});

  String passsward;
  @override
  List<Object> get props => [passsward];
}

class LoginApiEvent extends LoginEvent {}
