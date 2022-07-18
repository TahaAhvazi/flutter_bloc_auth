import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/services/loginservice.dart';

import 'blocs/login/login_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emialController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(RepositoryProvider.of<LoginUserService>(context)),
        child: Center(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
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
            },
          ),
        ),
      ),
    );
  }
}
