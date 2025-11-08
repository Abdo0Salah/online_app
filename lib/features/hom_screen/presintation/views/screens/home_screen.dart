import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/hom_screen/presintation/views/widgets/custom_card.dart';
import 'package:online_exam_app/features/hom_screen/presintation/views/widgets/custom_search_field.dart';

import '../../../../../core/di/di.dart';
import '../../view_model/home_event.dart';
import '../../view_model/home_states.dart';
import '../../view_model/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  final HomeViewModel homeViewModel = getIt<HomeViewModel>();

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
    return BlocProvider<HomeViewModel>(
      create: (context) =>
          homeViewModel
            ..doIntent(GetAllSubjectsEvent(token: homeViewModel.token)),

      child: Scaffold(
        appBar: AppBar(title: Text("Survey")),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBox(
              controller: _searchController,
              hintText: 'Search ',
              onChanged: _onSearchChanged,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Browse by subject', style: TextStyle(fontSize: 18)),
            ),
            BlocBuilder<HomeViewModel, HomeStates>(
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
                          height: 100,
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
                  return Text("No Data");
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
