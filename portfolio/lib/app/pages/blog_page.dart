import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<Map<String, dynamic>> data = [
    {
      "id": 1,
      "title": "A Real-time Collaborative Drawing App In Flutter",
      "des":
          "Users can join the same lobby/channel and draw together everything is synced instantly and displayed consistently on all screen sizes",
      "date": "2025-09-10",
      "image": AppConstats.blog1,
      "link":
          "https://www.linkedin.com/posts/siddardha-devarayapalli-80359122a_mvvm-riverpod-firebase-activity-7371024663495450624-GrbQ?utm_source=share&utm_medium=member_desktop&rcm=ACoAADllAEMBuOJErbGkDaDweCLYce0BZ7ezH0Y",
    },
    {
      "id": 1,
      "title": "Firebase Phone Authentication in Flutter: A Step-by-Step Guide",
      "des":
          "Firebase Phone Authentication is a popular method for verifying users’ identities in mobile applications. The steps to set up and implement phone authentication",
      "date": "2025-09-10",
      "image": AppConstats.blog2,
      "link":
          "https://medium.com/@siddardhadevarayapalli/implementing-firebase-phone-authentication-in-flutter-a-step-by-step-guide-ae71eef97436",
    },
    {
      "id": 1,
      "title": "Using the TradingView Flutter library",
      "des":
          "The TradingView widget you provided uses Javascript and isn’t directly compatible with Flutter for mobile apps, so i am trying to provides functionalities to display charts, customize them, and handle user interactions. It uses TradingView’s API to fetch and display market data.",
      "date": "2025-09-10",
      "image": AppConstats.blog3,
      "link":
          "https://medium.com/@siddardhadevarayapalli/using-the-tradingview-flutter-library-0772b74aedf7",
    },
  ];
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _isHoveredList = List.generate(data.length, (_) => false);
  }

  late List<bool> _isHoveredList;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: screenSize.width / 1.5,
        child: Wrap(
          children: [
            for (int i = 0; i < 3; i++) ...[
              InkWell(
                onTap: () {
                  final Uri url = Uri.parse(data[i]["link"]);
                  _launchUrl(url);
                },
                child: Container(
                  width: screenSize.width * 0.25,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppConstats.charlestonGreen,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: MouseRegion(
                          onEnter:
                              (_) => setState(() => _isHoveredList[i] = true),
                          onExit:
                              (_) => setState(() => _isHoveredList[i] = false),
                          child: AnimatedScale(
                            scale:
                                _isHoveredList[i]
                                    ? 1.05
                                    : 1.0, // zoom in 5% on hover
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: Image.asset(
                              data[i]["image"],
                              fit: BoxFit.cover,
                              height: screenSize.height * 0.28,
                              width: screenSize.width,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 15),
                        child: Text(
                          DateFormat(
                            "dd MMM yy",
                          ).format(DateTime.parse(data[i]["date"])),
                          style: TextStyling().siderheading.copyWith(
                            fontSize: 14,
                            color: AppConstats.orangeYellow,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 15),
                        child: Text(
                          data[i]["title"],
                          style: TextStyling().mainTitle.copyWith(
                            fontSize: 18,
                            color:
                                _isHoveredList[i] == true
                                    ? AppConstats.orangeYellow
                                    : AppConstats.lotion,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 15,
                          bottom: 10,
                        ),
                        child: Text(
                          data[i]["des"],
                          style: TextStyling().careerFonts.copyWith(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
