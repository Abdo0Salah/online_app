import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel,AuthStates>(
      listener: (context, state) {
        if (state.forgetPassword.isLoaded) {
          _isLoaded(context,state);
        } else if (state.forgetPassword.isError) {
          _isError(context);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _isLoaded(BuildContext context, AuthStates state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.forgetPassword.data?.info??"")),
    );
    Navigator.pushNamed(context,RoutesStrings.otpScreen);
  }

  void _isError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
  }

}
