import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/features/login/presentation/view_model/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          _isLoadingState(context);
        } else if (state is LoginLoaded) {
          _isLoadedState(context);
        } else if (state is LoginError) {
          _isErrorState(context);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _isLoadingState(context) {
    showDialog(
      context: context,
      builder: (context) =>
          Center(child: CircularProgressIndicator(color: ColorsManager.myBlue)),
    );
  }

  void _isLoadedState(context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text("Successfully"),
      ),
    );
    Navigator.pop(context);
    // Navigator.pushNamedAndRemoveUntil(
    //   context,
    //   RoutesStrings.homeScreen,
    //   (route) => false,
    // );
  }

  void _isErrorState(context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text("Something went wrong"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: AppStyles.font16BlackW500()),
          ),
        ],
      ),
    );
  }
}
