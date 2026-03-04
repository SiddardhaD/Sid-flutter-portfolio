import 'package:flutter/material.dart';
import 'package:portfolio/app/pages/page.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/core/base/responsive_utils.dart';

class Maincontainer extends StatefulWidget {
  const Maincontainer({super.key});

  @override
  State<Maincontainer> createState() => _MaincontainerState();
}

class _MaincontainerState extends State<Maincontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtils.w(context, 1000),
      margin: EdgeInsets.only(left: 20, top: 30, right: 10),
      decoration: Decorations().mainContainer,
      child: PageIndex(),
    );
  }
}
