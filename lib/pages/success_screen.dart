import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/bloc/auth_bloc.dart';
import 'package:flutter_responsive_login_ui/login_screen.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if(state is AuthInitial){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            }

            if(state is AuthFailure){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.text)));
            }
          },
          builder: (context, state) {
            if(state is AuthLoading){
              return CircularProgressIndicator();
            }
            return  Center(
                child: GradientButton(onPress: () {
                  context.read<AuthBloc>().add(AuthLogout());
                }),
              );
          },
        ));
  }
}
