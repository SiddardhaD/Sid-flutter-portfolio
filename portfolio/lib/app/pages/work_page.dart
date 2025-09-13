import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'dart:ui';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: screenSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < workData.length; i++)
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: screenSize.width / 2.6,
                        height: screenSize.height / 3,
                        decoration: BoxDecoration(
                          color: AppConstats.charlestonGreen,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: screenSize.height / 3,
                                margin: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(workData[i]["image"]),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(
                                  0.1,
                                ), // 👈 transparent white
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white.withOpacity(
                                    0.2,
                                  ), // 👈 subtle border
                                  width: 1.5,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10,
                                    sigmaY: 10,
                                  ), // 👈 blur background
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          workData[i]["subtitle"],
                                          style: TextStyling().aboutMe,
                                        ),
                                        Text(
                                          workData[i]["appname"],
                                          style: TextStyling().mainTitle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstats.featureWork,
                            style: TextStyling().aboutMe,
                          ),
                          Text(
                            workData[i]["name"],
                            style: TextStyling().mainTitle,
                          ),
                          Container(
                            width: screenSize.width / 3.5,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: AppConstats.blackOlive,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              workData[i]["appdes"],
                              style: TextStyling().careerFonts,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              workData[i]["stack"],
                              style: TextStyling().careerFonts.copyWith(
                                letterSpacing: 2,
                                fontWeight: FontWeight.w200,
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
      ),
    );
  }
}
