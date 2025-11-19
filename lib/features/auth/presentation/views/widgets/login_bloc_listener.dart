import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel,AuthStates>(
      listener: (context, state) {
      if (state.login.isLoaded) {
          _showSuccess(context);
        } else if (state.login.isError) {
          _showError(context, state.login.errorMessage ?? "Something went wrong");
        }
      },
      child: SizedBox.shrink(),
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
  }

  void _showSuccess(context) {
    if (Navigator.canPop(context)) Navigator.pop(context); // close loading
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 32),
        content: const Text("Login successful!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: AppStyles.font16BlackW500()),
          ),
        ],
      ),
    );
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
  void _showError(context, String message) {
    if (Navigator.canPop(context)) Navigator.pop(context); // close loading
      showDialog(
      context: context,
      builder: (_) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(message),
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
