import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/get_profile_data_event.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/get_profile_data_states.dart';
import 'package:online_exam_app/features/profile/presentation/view_model/profile_viewmodel.dart';
import '../../../../core/di/di.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/validators_utils.dart';
import '../../../../core/values/app_strings.dart';
import '../../../../core/values/routes_strings.dart';
import '../../../sign_up/presentation/views/widgets/custom_button.dart';
import '../../../sign_up/presentation/views/widgets/custom_text_from_field.dart';
import '../../data/models/update-request.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileViewModel profileViewModel = getIt<ProfileViewModel>();
  final _formKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   super.initState();
  //   // نبدأ جلب البيانات فور الدخول
  //   profileViewModel.doIntent(
  //     GetProfileDataEventEvent(token: profileViewModel.token),
  //   );
  // }

  // @override
  // void dispose() {
  //   // الحل السحري اللي مش محتاج تغيير أي حاجة تانية
  //   profileViewModel.close();   // نغلق الـ Cubit يدويًا
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModel>(
      create: (context) =>
          profileViewModel
            ..doIntent(GetProfileDataEventEvent(token: profileViewModel.token)),
      lazy: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(AppStrings.profile, style: AppStyles.font20BlackW500()),
        ),
        body: BlocBuilder<ProfileViewModel, ProfileStates>(
          builder: (context, state) {
            if (state.getProfileDataStates?.isError == true) {
              return Center(
                child: Text(state.getProfileDataStates!.errorMessage!),
              );
            } else if (state.getProfileDataStates?.isLoaded == true ||
                state.updateProfileDataStates?.isLoaded == true) {
              profileViewModel.userNameController.text =
                  state.getProfileDataStates?.data?.username ?? '';
              profileViewModel.emailController.text =
                  state.getProfileDataStates?.data?.email ?? '';
              profileViewModel.firstNameController.text =
                  state.getProfileDataStates?.data?.firstName ?? '';
              profileViewModel.lastNameController.text =
                  state.getProfileDataStates?.data?.lastName ?? '';
              profileViewModel.phoneController.text =
                  state.getProfileDataStates?.data?.phone ?? '';
              profileViewModel.passwordController.text =
                  AppStrings.hiddenPassword;
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 12),
                        CustomTextFromField(
                          label: AppStrings.userName,
                          hintText: AppStrings.enterUserName,
                          controller: profileViewModel.userNameController,
                          validator: ValidatorsUtils.validateUserName,
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFromField(
                                label: AppStrings.firstName,
                                hintText: AppStrings.enterFirstname,
                                controller:
                                    profileViewModel.firstNameController,
                                validator: ValidatorsUtils.validateFullName,
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: CustomTextFromField(
                                label: AppStrings.lastName,
                                hintText: AppStrings.enterLastName,
                                controller: profileViewModel.lastNameController,
                                validator: ValidatorsUtils.validateFullName,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        CustomTextFromField(
                          label: AppStrings.email,
                          hintText: AppStrings.enterEmail,
                          controller: profileViewModel.emailController,
                          validator: ValidatorsUtils.validateEmail,
                        ),
                        const SizedBox(height: 18),

                        BlocConsumer<ProfileViewModel, ProfileStates>(
                          listener: (context, state) {
                            var clicked = state.onClicked;
                            if (clicked == null) {
                              return;
                            } else if (clicked == true) {
                              Navigator.pushNamed(
                                context,
                                RoutesStrings.resetPasswordScreen,

                              );
                              profileViewModel.doIntent(
                                ClickedButton(click: false),
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomTextFromField(
                              label: AppStrings.password,
                              hintText: AppStrings.enterPassword,
                              controller: profileViewModel.passwordController,
                              enabled: true,
                              suffixTest: AppStrings.change,
                              onTap: () {
                                profileViewModel.doIntent(
                                  ClickedButton(click: true),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 18),
                        CustomTextFromField(
                          label: AppStrings.phone,
                          hintText: AppStrings.enterPhone,
                          controller: profileViewModel.phoneController,
                          validator: ValidatorsUtils.validatePhoneNumber,
                        ),
                        const SizedBox(height: 18),
                        const SizedBox(height: 8),
                        BlocListener<ProfileViewModel, ProfileStates>(
                          bloc: profileViewModel,
                          listener: (context, state) {
                            final updateProfileState =
                                state.updateProfileDataStates;
                            if (updateProfileState == null ||
                                updateProfileState.isInitial) {
                              return;
                            }

                            if (updateProfileState.isError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    updateProfileState.errorMessage!,
                                  ),
                                ),
                              );
                            } else if (updateProfileState.isLoaded) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(AppStrings.successfullyUpdated),
                                ),
                              );
                            }
                          },
                          child: CustomButton(
                            text: AppStrings.update,
                            onPressed: () {
                              validateUpdateProfile();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void validateUpdateProfile() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      UpdateRequest request = UpdateRequest(
        username: profileViewModel.userNameController.text,
        firstName: profileViewModel.firstNameController.text,
        lastName: profileViewModel.lastNameController.text,
        email: profileViewModel.emailController.text,
        phone: profileViewModel.phoneController.text,
      );
      profileViewModel.doIntent(
        UpdateProfileDataEventEvent(
          token: profileViewModel.token,
          updateRequest: request,
        ),
      );
    }
  }
}
