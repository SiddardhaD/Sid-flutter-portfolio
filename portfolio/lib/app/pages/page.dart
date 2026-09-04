import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_state.dart';
import 'package:portfolio/app/pages/about_me.dart';
import 'package:portfolio/app/pages/ai_page.dart';
import 'package:portfolio/app/pages/blog_page.dart';
import 'package:portfolio/app/pages/contact_page.dart';
import 'package:portfolio/app/pages/experience.dart';
import 'package:portfolio/app/pages/skills_page.dart';
import 'package:portfolio/app/pages/work_page.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/widgets/main_title.dart';
import 'package:portfolio/app/widgets/title_names.dart';

class PageIndex extends StatefulWidget {
  const PageIndex({super.key});

  @override
  State<PageIndex> createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<NavigationBloc, NavigationState>(
                  builder: (context, state) {
                    return MainTitle(title: navPageTitles[state.selectedItem]);
                  },
                ),
              ),
              const TitleNames(),
            ],
          ),
          BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              switch (state.selectedItem) {
                case 0:
                  return const AboutMe();
                case 1:
                  return ExperienceTimeline();
                case 2:
                  return const SkillsPage();
                case 3:
                  return const WorkPage();
                case 4:
                  return const AiPage();
                case 5:
                  return const BlogPage();
                default:
                  return const ContactPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
