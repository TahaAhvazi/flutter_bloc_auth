part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class UserAuthenticatedState extends AuthState {}

class UserUnAuthenticatedState extends AuthState {}

class UserLoadingAuthenticatedState extends AuthState {}
