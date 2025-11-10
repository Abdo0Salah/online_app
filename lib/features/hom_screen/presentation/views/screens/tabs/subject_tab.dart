import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_styles.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/values/app_strings.dart';
import 'package:online_exam_app/features/hom_screen/presentation/view_model/subject_event.dart';
import 'package:online_exam_app/features/hom_screen/presentation/view_model/subject_states.dart';
import 'package:online_exam_app/features/hom_screen/presentation/view_model/subject_viewmodel.dart';
import 'package:online_exam_app/features/hom_screen/presentation/views/widgets/custom_card.dart';

import '../../widgets/custom_search_field.dart';

class SubjectTab extends StatefulWidget {
  @override
  State<SubjectTab> createState() => _SubjectTabState();
}

class _SubjectTabState extends State<SubjectTab> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  final SubjectViewModel homeViewModel = getIt<SubjectViewModel>();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String q) {
    setState(() => _query = q);
    //API calls
  }

  Widget build(BuildContext context) {
    return BlocProvider<SubjectViewModel>(
      create: (context) =>
          homeViewModel
            ..doIntent(GetAllSubjectsEvent(token: homeViewModel.token)),

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
                if (state.getAllSubjectsStatess?.errorMessage != null &&
                    state.getAllSubjectsStatess!.errorMessage!.isNotEmpty) {
                  return Text(state.getAllSubjectsStatess!.errorMessage!);
                } else if (!(state.getAllSubjectsStatess?.isLoading ?? false) &&
                    state.getAllSubjectsStatess?.data != null &&
                    state.getAllSubjectsStatess!.data!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final subject =
                            state.getAllSubjectsStatess?.data![index];
                        return SizedBox(
                          width: double.infinity,
                          child: CustomCard(subjectModel: subject!),
                        );
                      },
                      itemCount: state.getAllSubjectsStatess?.data!.length,
                    ),
                  );
                } else if (!(state.getAllSubjectsStatess?.isLoading ?? false) &&
                    state.getAllSubjectsStatess?.data != null &&
                    state.getAllSubjectsStatess!.data!.isEmpty) {
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
