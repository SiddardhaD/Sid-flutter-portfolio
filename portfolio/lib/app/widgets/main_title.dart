import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/core/base/responsive_utils.dart';

class MainTitle extends StatefulWidget {
  final String title;
  const MainTitle({super.key, required this.title});

  @override
  State<MainTitle> createState() => _MainTitleState();
}

class _MainTitleState extends State<MainTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(widget.title, style: TextStyling().mainTitle),
          ),
          Container(
            height: 10,
            margin: EdgeInsets.only(top: 10, left: 20),
            width: ResponsiveUtils.w(context, 90),
            decoration: BoxDecoration(
              color: AppConstats.orangeYellow,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ],
      ),
    );
  }
}
