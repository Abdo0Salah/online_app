import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/auth_view_model.dart';


class VerifyPasswordBlocListener extends StatelessWidget {
  const VerifyPasswordBlocListener ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, AuthStates>(
      listener: (context, state) async {
        if (state.verifyResetCodeResponse.isLoading) {
          _showLoadingDialog(context);
        }
        else if (state.verifyResetCodeResponse.isLoaded) {
          _showSuccessfulDialog(context);
        }
        else if (state.verifyResetCodeResponse.isError) {
          _showErrorDialog(context);

        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Verifying code...",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSuccessfulDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Verification successful 🎉"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.pushReplacementNamed(context, RoutesStrings.resetPasswordScreen);

  }

  void _showErrorDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Something went wrong. Please try again."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );

  }
}
