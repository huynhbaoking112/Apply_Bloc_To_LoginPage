import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogin>(_login);
    on<AuthLogout>(_logout);

  }





  //---------Handle State with event-----------//
  void _login(AuthLogin event,Emitter<AuthState> emit) async {
      
      emit(AuthLoading());

      try {
        //Nếu như password nhỏ hơn 6 chữ số thì thả trạng thái lỗi

      if(event.password.length < 6){
         return emit(AuthFailure("Password must be more than 6 characters"));
         
      }


      await  Future.delayed(Duration(milliseconds: 1500), (){
        emit(AuthSuccess());
      });
      
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }

    }

  void _logout(AuthLogout event,Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      
      await Future.delayed(Duration(seconds: 1), (){
        emit(AuthInitial());
      });

    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
