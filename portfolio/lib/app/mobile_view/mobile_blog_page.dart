import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileBlogPage extends StatefulWidget {
  const MobileBlogPage({super.key});

  @override
  State<MobileBlogPage> createState() => _MobileBlogPageState();
}

class _MobileBlogPageState extends State<MobileBlogPage> {
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
      "id": 2,
      "title": "Firebase Phone Authentication in Flutter: A Step-by-Step Guide",
      "des":
          "Firebase Phone Authentication is a popular method for verifying users' identities in mobile applications. The steps to set up and implement phone authentication",
      "date": "2025-09-10",
      "image": AppConstats.blog2,
      "link":
          "https://medium.com/@siddardhadevarayapalli/implementing-firebase-phone-authentication-in-flutter-a-step-by-step-guide-ae71eef97436",
    },
    {
      "id": 3,
      "title": "Using the TradingView Flutter library",
      "des":
          "The TradingView widget you provided uses Javascript and isn't directly compatible with Flutter for mobile apps, so i am trying to provides functionalities to display charts, customize them, and handle user interactions. It uses TradingView's API to fetch and display market data.",
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
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          for (int i = 0; i < data.length; i++) ...[
            InkWell(
              onTap: () {
                final Uri url = Uri.parse(data[i]["link"]);
                _launchUrl(url);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: AppConstats.charlestonGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Blog Image
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.asset(
                        data[i]["image"],
                        fit: BoxFit.cover,
                        height: screenSize.height * 0.25,
                        width: double.infinity,
                      ),
                    ),

                    // Blog Content
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Date
                          Text(
                            DateFormat(
                              "dd MMM yy",
                            ).format(DateTime.parse(data[i]["date"])),
                            style: TextStyling().siderheading.copyWith(
                              fontSize: 12,
                              color: AppConstats.orangeYellow,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Title
                          Text(
                            data[i]["title"],
                            style: TextStyling().mainTitle.copyWith(
                              fontSize: 15,
                              color: AppConstats.lotion,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),

                          // Description
                          Text(
                            data[i]["des"],
                            style: TextStyling().careerFonts.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),

                          // Read More Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Read More",
                                style: TextStyling().titleNamesStyle.copyWith(
                                  fontSize: 12,
                                  color: AppConstats.orangeYellow,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward,
                                color: AppConstats.orangeYellow,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
