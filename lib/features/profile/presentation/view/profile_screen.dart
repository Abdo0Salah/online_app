import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/get_profile_data_event.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/get_profile_data_states.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/profile_viewmodel.dart';
import '../../../../core/di/di.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/values/app_strings.dart';
import '../../../sign_up/presentation/views/widgets/custom_text_from_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileViewmodel profileViewModel = getIt<ProfileViewmodel>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewmodel>(
      create: (context) => profileViewModel..doIntent(GetProfileDataEventEvent(token: profileViewModel.token)),

      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            AppStrings.profile,
            style: AppStyles.font20BlackW500(),
          ),
        ),
        //
        //             // BlocListener<SignUpViewModel, SignupStates>(
        //             //   bloc: signUpViewModel,
        //             //   listener: (context, state) {
        //             //     final signUpState = state.signUpStates;
        //             //     if (signUpState == null) {
        //             //       return;
        //             //     } else if (signUpState.errorMessage != null) {
        //             //       ScaffoldMessenger.of(context).showSnackBar(
        //             //         SnackBar(content: Text(signUpState.errorMessage!)),
        //             //       );
        //             //     } else if (signUpState.data != null) {
        //             //       ScaffoldMessenger.of(
        //             //         context,
        //             //       ).showSnackBar(const SnackBar(content: Text(AppStrings.accountCreatedSuccessfully)));
        //             //       Navigator.pushReplacementNamed(context,RoutesStrings.loginScreen,);
        //             //     }
        //             //   },
        //             //   child: CustomButton(
        //             //     text: AppStrings.signup,
        //             //     onPressed: validateSignUP,
        //             //   ),
        //             // ),

        body:BlocBuilder<ProfileViewmodel, ProfileStates>(
          builder: (context, state) {
            if (state.getProfileDataStates?.errorMessage != null &&
                state.getProfileDataStates!.errorMessage!.isNotEmpty) {
              return Text(state.getProfileDataStates!.errorMessage!);
            } else if (!(state.getProfileDataStates?.isLoading ?? false) &&
                state.getProfileDataStates?.data != null ) {
              profileViewModel.userNameController.text=state.getProfileDataStates?.data?.username??'';
              profileViewModel.emailController.text=state.getProfileDataStates?.data?.email??'';
              profileViewModel.firstNameController.text=state.getProfileDataStates?.data?.firstName??'';
              profileViewModel.lastNameController.text=state.getProfileDataStates?.data?.lastName??'';
              profileViewModel.phoneController.text=state.getProfileDataStates?.data?.phone??'';

              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 12),
                          CustomTextFromField(
                            label: AppStrings.userName,
                            hintText:AppStrings.enterUserName,
                            controller: profileViewModel.userNameController,
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFromField(
                                  label: AppStrings.firstName,
                                  hintText: AppStrings.enterFirstname,
                                  controller: profileViewModel.firstNameController,
                                ),
                              ),
                              const SizedBox(width: 18),
                              Expanded(
                                child: CustomTextFromField(
                                  label: AppStrings.lastName,
                                  hintText:AppStrings.enterLastName,
                                  controller: profileViewModel.lastNameController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          CustomTextFromField(
                            label: AppStrings.email,
                            hintText: AppStrings.enterEmail,
                            controller: profileViewModel.emailController,
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFromField(
                                  label: AppStrings.password,
                                  hintText: AppStrings.enterPassword,
                                  controller: profileViewModel.passwordController,
                                ),
                              ),
                              const SizedBox(width: 18),

                            ],
                          ),
                          const SizedBox(height: 18),
                          CustomTextFromField(
                            label: AppStrings.phone,
                            hintText: AppStrings.enterPhone,
                            controller: profileViewModel.phoneController,
                          ),
                          const SizedBox(height: 18),
                          const SizedBox(height: 8),
                          // BlocListener<SignUpViewModel, SignupStates>(
                          //   bloc: signUpViewModel,
                          //   listener: (context, state) {
                          //     final signUpState = state.signUpStates;
                          //     if (signUpState == null) {
                          //       return;
                          //     } else if (signUpState.errorMessage != null) {
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(content: Text(signUpState.errorMessage!)),
                          //       );
                          //     } else if (signUpState.data != null) {
                          //       ScaffoldMessenger.of(
                          //         context,
                          //       ).showSnackBar(const SnackBar(content: Text(AppStrings.accountCreatedSuccessfully)));
                          //       Navigator.pushReplacementNamed(context,RoutesStrings.loginScreen,);
                          //     }
                          //   },
                          //   child: CustomButton(
                          //     text: AppStrings.signup,
                          //     onPressed: validateSignUP,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),

              );
            } else if (!(state.getProfileDataStates?.isLoading ?? false) &&
                state.getProfileDataStates?.data != null ) {
              return Text(AppStrings.noDate);
            } else {
              return Center(child: const CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  // void validateSignUP() {
  //   FocusScope.of(context).unfocus();
  //   if (_formKey.currentState!.validate()) {
  //     UserRequest userRequest = UserRequest(
  //       username: signUpViewModel.userNameController.text,
  //       firstName: signUpViewModel.firstNameController.text,
  //       lastName: signUpViewModel.lastNameController.text,
  //       email: signUpViewModel.emailController.text,
  //       password: signUpViewModel.passwordController.text,
  //       rePassword: signUpViewModel.confirmPasswordController.text,
  //       phone: signUpViewModel.phoneController.text,
  //     );
  //     signUpViewModel.doIntent(SignUpEvent(userRequest: userRequest));
  //     // Navigator.pop(context).
  //   }
  // }
}