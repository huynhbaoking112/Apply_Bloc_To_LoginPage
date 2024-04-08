part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

//event login
class AuthLogin extends AuthEvent {

  String email;
  String password;

  AuthLogin({required this.email, required this.password});

}

//event logout
class AuthLogout extends AuthEvent{}



