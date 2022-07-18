import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_auth/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc_auth/services/loginservice.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserService _loginUserService;
  final AuthBloc authBloc;
  LoginBloc(this._loginUserService, this.authBloc) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final token =
            await _loginUserService.loginUser(event.email, event.password);
        authBloc.add(UserLoggedIn(token: token));
        emit(LoginSuccess());
        print(state);
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
