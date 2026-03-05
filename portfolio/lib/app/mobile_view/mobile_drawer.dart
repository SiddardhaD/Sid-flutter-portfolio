import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_bloc.dart';
import 'package:portfolio/app/bloc/navigation/navigation_event.dart';
import 'package:portfolio/app/bloc/navigation/navigation_state.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/core/base/responsive_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppConstats.eerieBlack,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: ResponsiveUtils.h(context, 20)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppConstats.onyx,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(AppConstats.profile),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: AppConstats.neonGreen,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppConstats.onyx, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                AppConstats.username,
                style: TextStyling().userName.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppConstats.onyx,
                ),
                child: Text(
                  AppConstats.userRole,
                  style: TextStyling().userRole.copyWith(fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Divider(color: AppConstats.onyx, height: 1),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    DrawerNavItem(
                      icon: Icons.person,
                      title: "About Me",
                      index: 0,
                    ),
                    DrawerNavItem(
                      icon: Icons.work,
                      title: "Experience",
                      index: 1,
                    ),
                    DrawerNavItem(
                      icon: Icons.code,
                      title: "Rapid Prototypes",
                      index: 2,
                    ),
                    DrawerNavItem(icon: Icons.article, title: "Blog", index: 3),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ContactInfoRow(
                      icon: Icons.email,
                      text: AppConstats.userEmail,
                    ),
                    SizedBox(height: 10),
                    ContactInfoRow(
                      icon: Icons.phone,
                      text: AppConstats.userphone,
                    ),
                    SizedBox(height: 10),
                    ContactInfoRow(
                      icon: Icons.location_on,
                      text: AppConstats.userlocation,
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(AppUrls.githubUrl));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppConstats.onyx,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppConstats.github,
                          height: 20,
                          width: 20,
                          color: AppConstats.quickSilver,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(AppUrls.linkedinUrl));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppConstats.onyx,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppConstats.linkedin,
                          height: 20,
                          width: 20,
                          color: AppConstats.quickSilver,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;

  const DrawerNavItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final isSelected = state.selectedItem == index;
        return InkWell(
          onTap: () {
            context.read<NavigationBloc>().add(NavigationItemSelected(index));
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? AppConstats.onyx : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    isSelected ? AppConstats.orangeYellow : Colors.transparent,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color:
                      isSelected
                          ? AppConstats.orangeYellow
                          : AppConstats.quickSilver,
                  size: 20,
                ),
                SizedBox(width: 15),
                Text(
                  title,
                  style: TextStyling().titleNamesStyle.copyWith(
                    color:
                        isSelected
                            ? AppConstats.orangeYellow
                            : AppConstats.lotion,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppConstats.orangeYellow, size: 16),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyling().careerFonts.copyWith(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
