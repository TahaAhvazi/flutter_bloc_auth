import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_auth/services/loginservice.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserService _loginUserService;
  AuthBloc(this._loginUserService) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      final bool hasToken = await _loginUserService.hasToken();
      if (hasToken) {
        emit(UserAuthenticatedState());
        // ignore: avoid_print
        print(state);
      } else {
        emit(UserUnAuthenticatedState());
        // ignore: avoid_print
        print(state);
      }
    });

    on<UserLoggedIn>((event, emit) async {
      UserLoadingAuthenticatedState();
      await _loginUserService.persistToken(event.token);
      emit(UserAuthenticatedState());
    });

    on<UserLoggedOut>((event, emit) async {
      UserLoadingAuthenticatedState();
      await _loginUserService.deleteToken();
      emit(UserUnAuthenticatedState());
    });
  }
}
