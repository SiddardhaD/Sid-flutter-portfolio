import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';

class TitleNames extends StatefulWidget {
  const TitleNames({super.key});

  @override
  State<TitleNames> createState() => _TitleNamesState();
}

class _TitleNamesState extends State<TitleNames> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.14,
      height: 60,
      decoration: BoxDecoration(
        color: AppConstats.charlestonGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NamesOfIndex(ontap: () {}, lable: "RESUME"),
          NamesOfIndex(ontap: () {}, lable: "EXPERIENCE"),
          NamesOfIndex(ontap: () {}, lable: "BLOG"),
        ],
      ),
    );
  }
}

class NamesOfIndex extends StatelessWidget {
  final String lable;
  final Function() ontap;
  const NamesOfIndex({super.key, required this.lable, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(lable, style: TextStyling().titleNamesStyle),
      ),
    );
  }
}
