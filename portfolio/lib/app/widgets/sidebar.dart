import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/core/base/responsive_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtils.w(context, 300),
      decoration: BoxDecoration(
        color: AppConstats.eerieBlack,
        border: Border.all(color: AppConstats.onyx, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20,
              vertical: ResponsiveUtils.h(context, 10),
            ),
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
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppConstats.neonGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.w(context, 20),
            ),
            child: Text(
              AppConstats.username,
              style: TextStyling().userName,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.w(context, 20),
              vertical: ResponsiveUtils.h(context, 5),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppConstats.onyx,
            ),
            child: Text(AppConstats.userRole, style: TextStyling().userRole),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.w(context, 20),
            ),
            child: Divider(height: 40, color: AppConstats.onyx),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.w(context, 10),
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileDetailCard(
                  title: AppConstats.email,
                  icon: Icons.email,
                  label: AppConstats.userEmail,
                  action: () {},
                ),
                SizedBox(height: 10),
                ProfileDetailCard(
                  title: AppConstats.phone,
                  icon: Icons.phone,
                  label: AppConstats.userphone,
                  action: () {},
                ),
                SizedBox(height: 10),
                ProfileDetailCard(
                  title: AppConstats.location,
                  icon: Icons.location_on,
                  label: AppConstats.userlocation,
                  action: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveUtils.h(context, 120)),
          SizedBox(
            width: ResponsiveUtils.w(context, 160),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(AppUrls.githubUrl));
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                      AppConstats.github,
                      color: AppConstats.quickSilver,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(AppUrls.linkedinUrl));
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                      AppConstats.linkedin,
                      color: AppConstats.quickSilver,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveUtils.h(context, 20)),
        ],
      ),
    );
  }
}

class ProfileDetailCard extends StatelessWidget {
  final String title;
  final String label;
  final IconData icon;
  final Function() action;
  const ProfileDetailCard({
    super.key,
    required this.icon,
    required this.label,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: screenSize.width * 0.025,
          width: screenSize.width * 0.025,
          decoration: BoxDecoration(
            color: AppConstats.raisinBlack,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppConstats.blackOlive.withOpacity(0.6),
                offset: const Offset(-2, -2),
                blurRadius: 10,
              ),
              BoxShadow(
                color: AppConstats.blackOlive.withOpacity(0.1),
                offset: const Offset(0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.amber,
              size: screenSize.width * 0.012,
            ),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: ResponsiveUtils.w(context, 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyling().siderheading),
              InkWell(
                onTap: action,
                child: Text(label, style: TextStyling().siderAnswer),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
