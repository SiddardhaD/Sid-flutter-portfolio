import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'dart:ui';

class MobileWorkPage extends StatefulWidget {
  const MobileWorkPage({super.key});

  @override
  State<MobileWorkPage> createState() => _MobileWorkPageState();
}

class _MobileWorkPageState extends State<MobileWorkPage> {
  List<Map<String, dynamic>> workData = [
    {
      "name": "Smart Home",
      "appname": "Smart Home App with Neomorphism",
      "subtitle": "Building a Smart Home App with Neomorphism UI in Flutter!",
      "appdes":
          " I used the Neomorphism package in Flutter to design smooth, eye-catching controls for managing smart devices. The app lets users control lights, thermostats, security cameras, and more—all from one beautiful interface.",
      "stack": "Flutter | Android | iOS | Neomorphism",
      "image": AppConstats.work1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          for (int i = 0; i < workData.length; i++)
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppConstats.charlestonGreen,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured Work Badge
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstats.featureWork,
                          style: TextStyling().aboutMe.copyWith(fontSize: 11),
                        ),
                        SizedBox(height: 5),
                        Text(
                          workData[i]["name"],
                          style: TextStyling().mainTitle.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  // Image with Overlay
                  Stack(
                    children: [
                      // Background Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          height: screenSize.height * 0.35,
                          width: double.infinity,
                          child: Image.asset(
                            workData[i]["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Glass Morphism Overlay
                      Positioned(
                        bottom: 15,
                        left: 15,
                        right: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1.5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      workData[i]["subtitle"],
                                      style: TextStyling().aboutMe.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      workData[i]["appname"],
                                      style: TextStyling().mainTitle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Description
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: AppConstats.blackOlive,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            workData[i]["appdes"],
                            style: TextStyling().careerFonts.copyWith(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(height: 15),

                        // Tech Stack
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppConstats.onyx,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            workData[i]["stack"],
                            style: TextStyling().careerFonts.copyWith(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
