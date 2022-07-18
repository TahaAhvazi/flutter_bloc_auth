import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_auth/services/loginservice.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserService _loginUserService;
  LoginBloc(this._loginUserService) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      LoginLoading();
      final token =
          await _loginUserService.loginUser(event.email, event.password);
      print("this is the TOKEN");
    });
  }
}
