import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';

class MobileExperienceTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> experiences = [
    {
      "role": "Lead Flutter Developer",
      "company": "Novizco Infotech",
      "date": "Sept 2025 — Present",
      "service": true,
      "desc":
          "Leading Flutter development for Android and iOS applications, working on the Collectors Card mobile application. Handling UI, architecture, API integration, state management, debugging and production issues. Integrated Firebase, Sentry, Amplitude and Unity, and manage Play Store, App Store and TestFlight releases. Working closely with Product, Backend, Design and QA teams to improve application stability and performance, and using Claude and Cursor for code analysis, debugging, refactoring and development productivity.",
    },
    {
      "role": "Flutter Developer",
      "company": "Shervani Tech Hub Pvt Ltd | Client: WWT / Krispy Kreme",
      "date": "Mar 2025 — Sept 2025",
      "service": true,
      "desc":
          "Worked on the Krispy Kreme mobile application, developing and maintaining Flutter features including Auto-Apply Coupons, Offers and Promotions. Fixed production issues, improved application stability, collaborated with cross-functional teams and supported mobile releases.",
    },
    {
      "role": "Associate Tech Lead",
      "company": "IdeyaLabs | Project: ChargeSavvy POS",
      "date": "Nov 2024 — Mar 2025",
      "service": true,
      "desc":
          "Worked on ChargeSavvy, a restaurant and club POS application covering inventory, orders, tabs, merging/transfers, discounts and fees. Implemented PayLater and PreAuth payment workflows with real-time API synchronization and role-based functionality, with a focus on error handling and production-focused engineering.",
    },
    {
      "role": "Senior Flutter Developer",
      "company": "PhotonX Tech Pvt Ltd",
      "date": "Jan 2023 — Aug 2024",
      "service": true,
      "desc":
          "Worked across multiple projects including Stellar HR, EmpireAI, Vibho HCM, Sunray Resort Mapping, MomsFoood and QuickNews, using Flutter, Dart, BLoC, GetX, MVC, Node.js, MongoDB, MySQL and AWS EC2.",
    },
    {
      "role": "Flutter Developer",
      "company": "Infiyodha Solutions Pvt Ltd",
      "date": "June 2021 — Dec 2022",
      "service": false,
      "desc":
          "Worked on Briscart and Konnect Homes using Flutter, Python Flask, MySQL, APIs and smart-home integrations.",
    },
    {
      "role": "IoT Specialist",
      "company": "Inforepos Pvt Ltd",
      "date": "Jan 2019 — June 2021",
      "service": false,
      "desc":
          "Worked on Simplifarms agricultural IoT systems with ESP controllers, sensors and field monitoring. Integrated hardware and software for irrigation and water-pumping systems, with a focus on real-time data and device control.",
    },
  ];

  MobileExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          for (int i = 0; i < experiences.length; i++) ...[
            MobileExperienceCard(
              role: experiences[i]["role"],
              company: experiences[i]["company"],
              date: experiences[i]["date"],
              service: experiences[i]["service"],
              des: experiences[i]["desc"],
              index: i,
              isLast: i == experiences.length - 1,
            ),
          ],
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class MobileExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String date;
  final bool service;
  final String des;
  final int index;
  final bool isLast;

  const MobileExperienceCard({
    super.key,
    required this.company,
    required this.date,
    required this.des,
    required this.role,
    required this.service,
    required this.index,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Indicator
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(41, 198, 196, 196),
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: AppConstats.orangeYellow,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 120,
                color: AppConstats.charlestonGreen,
              ),
          ],
        ),
        SizedBox(width: 15),
        // Experience Content
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: isLast ? 0 : 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppConstats.blackOlive,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppConstats.onyx, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role,
                  style: TextStyling().userName.copyWith(fontSize: 13),
                ),
                SizedBox(height: 6),
                Text(
                  company,
                  style: TextStyling().careerFonts.copyWith(fontSize: 11),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppConstats.onyx,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    date,
                    style: TextStyling().aboutMe.copyWith(
                      color: AppConstats.orangeYellow,
                      fontSize: 10,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  des,
                  style: TextStyling().careerFonts.copyWith(fontSize: 11),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
