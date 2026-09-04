import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_event.dart';
import 'package:portfolio/app/bloc/navigation/navigation_state.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';

class TitleNames extends StatelessWidget {
  const TitleNames({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 420, minWidth: 140),
      height: 60,
      decoration: BoxDecoration(
        color: AppConstats.charlestonGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          topRight: Radius.circular(25),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            for (int i = 0; i < navLabels.length; i++)
              NamesOfIndex(
                index: i,
                ontap: () {
                  context.read<NavigationBloc>().add(NavigationItemSelected(i));
                },
                lable: navLabels[i],
              ),
          ],
        ),
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
                        ? TextStyling().titleNamesStyle.copyWith(
                          color: AppConstats.orangeYellow,
                        )
                        : TextStyling().aboutMe.copyWith(fontSize: 12),
              ),
            ),
          ),
        );
      },
    );
  }
}
