part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//----------Trạng thái của login-----------//

// trạng thái đăng nhập thành công
final class AuthSuccess extends AuthState{}














// ------------------ Trạng thái chung-----------//

//Trạng thái lỗi
final class AuthFailure extends AuthState{
  final String text;
  AuthFailure(this.text);
}


//Trạng thái loading
final class AuthLoading extends AuthState{}


