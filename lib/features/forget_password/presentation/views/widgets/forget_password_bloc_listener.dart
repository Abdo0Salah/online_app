import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_model/forget_password_view_model.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.forgetPasswordModel.info ?? "")),
          );
        } else if (state is ForgetPasswordError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
        }
      },
      child: SizedBox.shrink(),
    );
  }

}
