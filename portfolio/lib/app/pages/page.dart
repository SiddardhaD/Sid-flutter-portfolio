import 'package:flutter/material.dart';
import 'package:portfolio/app/pages/about_me.dart';
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
            children: [MainTitle(title: "About Me"), TitleNames()],
          ),
          AboutMe(),
        ],
      ),
    );
  }
}
