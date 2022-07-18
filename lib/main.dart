import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/HOme.dart';
import 'package:flutter_bloc_auth/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc_auth/mainpage.dart';
import 'package:flutter_bloc_auth/services/loginservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(LoginUserService())..add(AppStarted()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        //TODO: import the auth bloc here and use the blocBuilder here for more information
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UserAuthenticatedState) {
              return const MainScreen();
            }
            if (state is UserLoadingAuthenticatedState) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is UserUnAuthenticatedState) {
              return const HomePage();
            }
            return const Scaffold(
              body: Center(
                child: Text("UNKNOWN ERROOOOR"),
              ),
            );
          },
        ),
      ),
    );
  }
}
