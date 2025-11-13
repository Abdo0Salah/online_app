import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/values/routes_strings.dart';
import 'package:online_exam_app/features/forget_password/presentation/view_model/verify_reset_code/verify_password_view_model.dart';


class VerifyPasswordBlocListener extends StatelessWidget {
  const VerifyPasswordBlocListener ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyPasswordViewModel, VerifyPasswordState>(
      listener: (context, state) async {
        if (state is VerifyPasswordLoading) {
          _showLoadingDialog(context);
        }
        else if (state is VerifyPasswordLoaded) {
          _showSuccessfulDialog(context);
        }
        else if (state is VerifyPasswordError) {
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
