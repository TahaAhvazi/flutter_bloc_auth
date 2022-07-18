// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class UserLoggedIn extends AuthEvent {
  final String token;
  const UserLoggedIn({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}

class UserLoggedOut extends AuthEvent {}
