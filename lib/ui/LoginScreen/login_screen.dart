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
    // TODO: implement initState
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
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
                  builder: (context, state) {
                    return TextFormField(
                      obscureText: true,
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
                ElevatedButton(onPressed: () {}, child: Text("Login"))
              ],
            ),
          ),
        ));
  }
}
