import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc_auth/mainpage.dart';
import 'package:flutter_bloc_auth/services/loginservice.dart';

import 'blocs/login/login_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emialController = TextEditingController();
    final _passwordController = TextEditingController();
    return RepositoryProvider(
      create: (context) => LoginUserService(),
      child: Scaffold(
        body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
              RepositoryProvider.of<LoginUserService>(context),
              AuthBloc(LoginUserService())),
          child: Center(
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Login failed."),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is LoginInitial) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _emialController,
                        ),
                        TextField(
                          controller: _passwordController,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginButtonPressed(
                                    email: _emialController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          },
                          child: const Text("Post Request"),
                        ),
                      ],
                    );
                  }
                  if (state is LoginSuccess) {
                    return MainScreen();
                  }
                  return HomePage();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
