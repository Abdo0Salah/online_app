import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/colors_manager.dart';
import 'package:online_exam_app/core/values/assets_strings.dart';
import 'package:online_exam_app/features/hom_screen/presentation/subject/views/screens/tabs/profile_tab.dart';
import 'package:online_exam_app/features/hom_screen/presentation/subject/views/screens/tabs/result_tab.dart';
import 'package:online_exam_app/features/hom_screen/presentation/subject/views/screens/tabs/subject_tab.dart';
import 'package:online_exam_app/features/profile/presentation/view/profile_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor  : ColorsManager.myBlue,
        unselectedItemColor: ColorsManager.black30,
        backgroundColor: ColorsManager.lightBlue,
        items: [
          BottomNavigationBarItem(
            backgroundColor: ColorsManager.lightBlue,
            icon: ImageIcon(AssetImage(AssetsStrings.exploreIcon)),
            label: ("Explore"),
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsManager.lightBlue,
            icon: ImageIcon(AssetImage(AssetsStrings.resultIcon)),
            label: ("Result"),
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorsManager.lightBlue,
            icon: ImageIcon(AssetImage(AssetsStrings.profileIcon)),
            label: ("Profile"),
          ),
        ],
        onTap: (value) {
          index = value;
          setState(() {});
        },
        currentIndex: index,
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [SubjectTab(), ResultTab(), ProfileScreen()];
}
