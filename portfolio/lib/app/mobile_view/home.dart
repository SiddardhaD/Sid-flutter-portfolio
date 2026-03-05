import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_state.dart';
import 'package:portfolio/app/mobile_view/mobile_about_me.dart';
import 'package:portfolio/app/mobile_view/mobile_blog_page.dart';
import 'package:portfolio/app/mobile_view/mobile_drawer.dart';
import 'package:portfolio/app/mobile_view/mobile_experience.dart';
import 'package:portfolio/app/mobile_view/mobile_work_page.dart';
import 'package:portfolio/app/utils/constants.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: AppConstats.eerieBlack,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: AppConstats.orangeYellow),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return Text(
              state.selectedItem == 0
                  ? "About Me"
                  : state.selectedItem == 1
                  ? "Experience"
                  : state.selectedItem == 2
                  ? "Rapid Prototypes"
                  : "Blog",
              style: TextStyle(
                color: AppConstats.lotion,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        centerTitle: true,
      ),
      drawer: MobileDrawer(),
      body: SafeArea(
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return state.selectedItem == 0
                ? MobileAboutMe()
                : state.selectedItem == 1
                ? MobileExperienceTimeline()
                : state.selectedItem == 2
                ? MobileWorkPage()
                : MobileBlogPage();
          },
        ),
      ),
    );
  }
}
