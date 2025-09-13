import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_event.dart';
import 'package:portfolio/app/bloc/navigation/navigation_state.dart';
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
      width: screenSize.width * 0.2,
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
          NamesOfIndex(
            index: 0,
            ontap: () {
              context.read<NavigationBloc>().add(NavigationItemSelected(0));
            },
            lable: "ABOUT ME",
          ),
          NamesOfIndex(
            index: 1,
            ontap: () {
              context.read<NavigationBloc>().add(NavigationItemSelected(1));
            },
            lable: "EXPERIENCE",
          ),
          NamesOfIndex(
            index: 2,
            ontap: () {
              context.read<NavigationBloc>().add(NavigationItemSelected(2));
            },
            lable: "WORK",
          ),
          NamesOfIndex(
            index: 3,
            ontap: () {
              context.read<NavigationBloc>().add(NavigationItemSelected(3));
            },
            lable: "BLOG",
          ),
        ],
      ),
    );
  }
}

class NamesOfIndex extends StatelessWidget {
  final String lable;
  final int index;
  final Function() ontap;
  const NamesOfIndex({
    super.key,
    required this.lable,
    required this.ontap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
          transform:
              Matrix4.identity()
                ..scale(state.selectedItem == index ? 1.0 : 0.9),
          child: InkWell(
            onTap: ontap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                lable,
                style:
                    state.selectedItem == index
                        ? TextStyling().titleNamesStyle
                        : TextStyling().aboutMe.copyWith(fontSize: 12),
              ),
            ),
          ),
        );
      },
    );
  }
}
