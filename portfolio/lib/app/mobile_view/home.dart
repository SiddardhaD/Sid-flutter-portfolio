import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_state.dart';
import 'package:portfolio/app/mobile_view/mobile_drawer.dart';
import 'package:portfolio/app/mobile_view/mobile_experience.dart';
import 'package:portfolio/app/pages/about_me.dart';
import 'package:portfolio/app/pages/ai_page.dart';
import 'package:portfolio/app/pages/blog_page.dart';
import 'package:portfolio/app/pages/contact_page.dart';
import 'package:portfolio/app/pages/skills_page.dart';
import 'package:portfolio/app/pages/work_page.dart';
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
              navPageTitles[state.selectedItem],
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
            switch (state.selectedItem) {
              case 0:
                return const SingleChildScrollView(child: AboutMe());
              case 1:
                return SingleChildScrollView(child: MobileExperienceTimeline());
              case 2:
                return const SingleChildScrollView(child: SkillsPage());
              case 3:
                return const SingleChildScrollView(child: WorkPage());
              case 4:
                return const SingleChildScrollView(child: AiPage());
              case 5:
                return const BlogPage();
              default:
                return const SingleChildScrollView(child: ContactPage());
            }
          },
        ),
      ),
    );
  }
}
