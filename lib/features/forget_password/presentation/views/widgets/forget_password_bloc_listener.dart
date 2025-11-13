import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_model/forget_password_view_model/forget_password_view_model.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoaded) {
          _isLoading(context,state);
        } else if (state is ForgetPasswordError) {
          _isError(context);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _isLoading(BuildContext context, ForgetPasswordLoaded state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.forgetPasswordModel.info ?? "")),
    );
    Navigator.pushNamed(context,RoutesStrings.otpScreen);
  }

  void _isError(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
  }

}
