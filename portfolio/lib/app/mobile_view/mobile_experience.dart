import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';

class MobileExperienceTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> experiences = [
    {
      "role": "Lead Flutter Developer",
      "company": "Prism Cloud Consulting | Client: Collectors Card",
      "date": "Sept 2025 — Present",
      "service": true,
      "desc":
          "Contributing to the Collectors Card mobile application by developing and maintaining features related to collector card management and real-time data synchronization. Implemented API models, Realm database models, and repository layers to handle card information efficiently. Integrated WebSocket events to synchronize collector card data in real time and ensured seamless UI updates using Riverpod state management. Collaborated with backend and product teams to optimize performance, resolve production issues, and deliver scalable, production-ready features across both Android and iOS platforms.",
    },
    {
      "role": "Sr Flutter Developer",
      "company": "Shervani Tech Hub Pvt Ltd (Payroll) | Client: WWT",
      "date": "Mar 2025 — Sept 2025",
      "service": true,
      "desc":
          "Contributing to the Krispy Kreme Mobile Application, a flagship app for the USA-based doughnut brand, by implementing features like Auto-Apply Coupons to enhance checkout and increase conversions. Improved the Offers & Promotions UI to deliver a seamless and brand-consistent user experience, while collaborating with cross-functional teams to resolve critical bugs, optimize performance, and ensure production-ready releases. Actively involved in feature rollouts, app maintenance, and enhancements across both Android and iOS platforms.",
    },
    {
      "role": "Associate Tech Lead & Flutter Developer",
      "company": "Ideyalbs",
      "date": "Oct 2024 — Mar 2025",
      "service": true,
      "desc":
          "Spearheaded the development of ChargeSavvy, a comprehensive POS application for restaurants and clubs with advanced inventory, order, and payment management features. The app supports multi-role access, real-time data synchronization via APIs, and secure workflows.",
    },
    {
      "role": "Flutter Developer",
      "company": "PhotonX Tech Pvt Ltd",
      "date": "July 2023 — Aug 2024",
      "service": true,
      "desc":
          "Led the development of multiple applications including Stellar HR, a self-service employee management app; EmpireAI, a trading platform with real-time analytics; and Vibho HCM, a human capital management tool (BLoC-based). Ensuring smooth UI/UX and robust backend integration. Also created QuickNews, a fast, multimedia-enabled news application designed for quick updates and simplicity.",
    },
    {
      "role": "Flutter Developer",
      "company": "Infiyoda Solutions Pvt Ltd",
      "date": "July 2021 — Dec 2022",
      "service": false,
      "desc":
          "Developed Briscart Shopping App & WebApp, a unified shopping platform integrating multiple stores with advanced product search and referral features. Also built Konnect Homes, a SmartHome solution to control and schedule appliances, working on both frontend in Flutter and backend using Flask with MySQL.",
    },
    {
      "role": "IOT Specialist",
      "company": "Inforepos Pvt Ltd",
      "date": "Jan 2019 — Jun 2021",
      "service": false,
      "desc":
          "At Inforepos Pvt Ltd, I worked as an IoT Specialist contributing to the design and development of IoT-based agricultural solutions. One of the key projects was Simplifarms, an innovative smart farming product that integrates IoT devices with mobile applications for efficient agricultural management.",
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
