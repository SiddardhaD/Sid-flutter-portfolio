import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_state.dart';
import 'package:portfolio/app/pages/about_me.dart';
import 'package:portfolio/app/pages/blog_page.dart';
import 'package:portfolio/app/pages/experience.dart';
import 'package:portfolio/app/pages/work_page.dart';
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
              BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
                  return MainTitle(
                    title:
                        state.selectedItem == 0
                            ? "About Me"
                            : state.selectedItem == 1
                            ? "Experience"
                            : state.selectedItem == 2
                            ? "Rapid Prototypes"
                            : "Blog",
                  );
                },
              ),
              TitleNames(),
            ],
          ),
          // WorkPage(),
          BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) {
              return state.selectedItem == 0
                  ? AboutMe()
                  : state.selectedItem == 1
                  ? ExperienceTimeline()
                  : state.selectedItem == 2
                  ? WorkPage()
                  : BlogPage();
            },
          ),
        ],
      ),
    );
  }
}
