import 'package:blockprec/bloc/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  final emailfocuse = FocusNode();

  final passfocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => _loginBloc,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.email != current.email,
                    builder: (context, state) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailfocuse,
                        onChanged: (email) {
                          context
                              .read<LoginBloc>()
                              .add(EmailAddress(email: email));
                        },
                        onFieldSubmitted: (value) {},
                        decoration: InputDecoration(
                          label: Text("Email"),
                          border: OutlineInputBorder(),
                        ),
                      );
                    },
                  ),
                  Gap(20),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.passsward != current.passsward,
                    builder: (context, state) {
                      return TextFormField(
                        obscureText: false,
                        focusNode: passfocus,
                        onChanged: (passsward) {
                          context
                              .read<LoginBloc>()
                              .add(Passsward(passsward: passsward));
                        },
                        onFieldSubmitted: (value) {},
                        decoration: InputDecoration(
                            label: Text("Passsward"),
                            border: OutlineInputBorder()),
                      );
                    },
                  ),
                  Gap(250),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state.loginStatus == LoginStatus.error) {
                        print(state.message);
                        print("error");
                      }
                      if (state.loginStatus == LoginStatus.loading) {
                        Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state.loginStatus == LoginStatus.loading) {
                        print("login Sucussefully");
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginApiEvent());
                            },
                            child: Text("Login"));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
