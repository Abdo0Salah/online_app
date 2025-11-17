import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import '../../../view_model/subject_event.dart';
import '../../../view_model/subject_states.dart';
import '../../../view_model/subject_viewmodel.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_search_field.dart';

class SubjectTab extends StatefulWidget {
  const SubjectTab({super.key});

  @override
  State<SubjectTab> createState() => _SubjectTabState();
}

class _SubjectTabState extends State<SubjectTab> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  final SubjectViewModel subjectViewModel = getIt<SubjectViewModel>();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String q) {
    setState(() => _query = q);
    //API calls
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubjectViewModel>(
      create: (context) =>
          subjectViewModel
            ..doIntent(GetAllSubjectsEvent(token: subjectViewModel.token)),

      child: Scaffold(
        appBar: AppBar(title: Text(AppStrings.exploreAppBarTitle,style: AppStyles.font20BlackW500().copyWith(color:ColorsManager.myBlue ),)),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBox(
              controller: _searchController,
              hintText: AppStrings.exploreSearch,
              onChanged: _onSearchChanged,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                AppStrings.browseBySubject,
                style: AppStyles.font18BlackW500(),
              ),
            ),
            BlocBuilder<SubjectViewModel, SubjectStates>(
              builder: (context, state) {
                if (state.getAllSubjectsStates?.errorMessage != null &&
                    state.getAllSubjectsStates!.errorMessage!.isNotEmpty) {
                  return Text(state.getAllSubjectsStates!.errorMessage!);
                } else if (!(state.getAllSubjectsStates?.isLoading ?? false) &&
                    state.getAllSubjectsStates?.data != null &&
                    state.getAllSubjectsStates!.data!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final subject =
                            state.getAllSubjectsStates?.data![index];
                        return SizedBox(
                          width: double.infinity,
                          child: InkWell (
                            onTap:
                              () {
                                subjectViewModel.doIntent(NavigateToExamsEvent(subject, context));
                              },
                              child: CustomCard(subjectModel: subject!)),
                        );
                      },
                      itemCount: state.getAllSubjectsStates?.data!.length,
                    ),
                  );
                } else if (!(state.getAllSubjectsStates?.isLoading ?? false) &&
                    state.getAllSubjectsStates?.data != null &&
                    state.getAllSubjectsStates!.data!.isEmpty) {
                  return Text(AppStrings.noDate);
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
