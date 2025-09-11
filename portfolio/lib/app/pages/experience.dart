import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';

class ExperienceTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> experiences = [
    {
      "role": "Sr Flutter Developer",
      "company": "Shervani Tech Hub",
      "date": "Mar 2025 — Present",
      "service": true,
      "desc":
          "Facilitating trainee's proficiency in Flutter by offering hands-on coding guidance, mentoring, and efficient app construction.",
    },
    {
      "role": "Associate Tech Lead & Flutter Developer",
      "company": "Ideyalbs",
      "date": "Oct 2024 — Mar 2025",
      "service": true,
      "desc":
          "Facilitating trainee's proficiency in Flutter by offering hands-on coding guidance, mentoring, and efficient app construction.",
    },
    {
      "role": "Flutter Developer",
      "company": "PhotonX Tech Pvt Ltd",
      "date": "July 2023 — Aug 2024",
      "service": true,
      "desc": "Worked on projects like GIFT City Project as Application Lead.",
    },
    {
      "role": "Flutter Developer",
      "company": "Infiyoda Solutions Pvt Ltd",
      "date": "July 2021 — Dec 2022",
      "service": false,
      "desc":
          "Worked over technologies like Java, C++, C, and Microsoft Office.",
    },
    {
      "role": "IOT Specialist",
      "company": "Inforepos Pvt Ltd",
      "date": "Jan 2019 — Jun 2021",
      "service": false,
      "desc": "Worked on MicroControllers.",
    },
  ];

  ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stepper(
            physics: BouncingScrollPhysics(),
            controlsBuilder:
                (context, details) => Text(
                  AppConstats.careerHighLight,
                  style: TextStyling().titleNamesStyle.copyWith(fontSize: 18),
                ),
            steps:
                experiences.map((exp) {
                  return Step(
                    title: Text(
                      exp["role"]!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exp["company"]!,
                          style: TextStyle(color: Colors.grey[300]),
                        ),
                        Text(
                          exp["date"]!,
                          style: TextStyle(color: Colors.tealAccent),
                        ),
                        SizedBox(height: 5),
                        Text(
                          exp["desc"]!,
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    ),
                    content: SizedBox.shrink(),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
