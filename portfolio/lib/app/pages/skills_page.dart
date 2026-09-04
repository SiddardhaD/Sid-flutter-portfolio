import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/app/widgets/common_widgets.dart';

class SkillCategory {
  final String title;
  final IconData icon;
  final List<String> items;
  const SkillCategory(this.title, this.icon, this.items);
}

const List<SkillCategory> skillCategories = [
  SkillCategory("Mobile", Icons.phone_iphone, [
    "Flutter",
    "Dart",
    "Android",
    "iOS",
    "Flutter Web",
    "Platform Channels",
    "Native Integrations",
    "Unity Integration",
  ]),
  SkillCategory("Architecture & State", Icons.account_tree_outlined, [
    "Clean Architecture",
    "MVC",
    "MVVM",
    "BLoC",
    "Riverpod",
    "Provider",
    "GetX",
  ]),
  SkillCategory("Backend & APIs", Icons.dns_outlined, [
    "REST APIs",
    "WebSockets",
    "Node.js",
    "Python",
    "Flask",
    "JSON",
  ]),
  SkillCategory("Databases", Icons.storage_outlined, [
    "MySQL",
    "MongoDB",
    "SQLite",
    "Firestore",
  ]),
  SkillCategory("Cloud & Firebase", Icons.cloud_outlined, [
    "Firebase Auth",
    "Firestore",
    "Cloud Functions",
    "Crashlytics",
    "AWS EC2",
    "GCP",
  ]),
  SkillCategory("DevOps & Release", Icons.rocket_launch_outlined, [
    "Git",
    "GitHub",
    "CI/CD",
    "CodeMagic",
    "Google Play Console",
    "App Store Connect",
    "TestFlight",
  ]),
  SkillCategory("Monitoring & Analytics", Icons.insights_outlined, [
    "Sentry",
    "Crashlytics",
    "Amplitude",
  ]),
  SkillCategory("Payments", Icons.payments_outlined, [
    "Razorpay",
    "Stripe",
    "Worldline",
    "NTT DATA",
  ]),
  SkillCategory("AI / GenAI", Icons.auto_awesome_outlined, [
    "Python for AI",
    "LLMs",
    "Prompt Engineering",
    "RAG",
    "Ollama",
    "Hugging Face",
    "AI-assisted Development",
    "Claude",
    "Cursor",
  ]),
];

const List<String> architectureLayers = [
  "Presentation",
  "BLoC / Riverpod",
  "Domain / Business Logic",
  "Repository",
  "API / Database / External Services",
];

const List<String> architectureInfra = [
  "Firebase",
  "Authentication",
  "Analytics",
  "Crash Monitoring",
  "Local Storage",
  "CI/CD",
];

const List<String> paymentMethods = ["Razorpay", "Stripe", "Worldline", "NTT DATA"];
const String paymentDescription =
    "Hands-on experience integrating payment workflows including payment initiation, success/failure handling, transaction status validation, backend confirmation, error handling and production troubleshooting.";

const List<String> leadershipPoints = [
  "Led cross-functional teams involving frontend, backend and design.",
  "Owned features from requirement understanding through production release.",
  "Participated in architecture and technical decisions.",
  "Mentored developers and supported knowledge sharing.",
  "Worked closely with Product, Backend, Design and QA teams.",
  "Handled production debugging and critical issue resolution.",
  "Focused on maintainability, scalability and engineering best practices.",
];

/// Skills, architecture, payments & leadership — one responsive page shared
/// by desktop and mobile.
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: "Skills",
            caption: "Categorized by area — depth varies, breadth is real.",
          ),
          const SizedBox(height: 6),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final columns = width > 900 ? 2 : 1;
              const spacing = 16.0;
              final cardWidth =
                  columns == 1 ? width : (width - spacing) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  for (final cat in skillCategories)
                    SizedBox(
                      width: cardWidth,
                      child: SkillCategoryCard(category: cat),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 36),
          const SectionHeader(title: "Flutter Architecture"),
          const ArchitectureDiagram(),
          const SizedBox(height: 36),
          const SectionHeader(title: "Payment & Transaction Experience"),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(paymentDescription, style: TextStyling().careerFonts),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final p in paymentMethods)
                      PillBadge(label: p, outlined: true),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          const SectionHeader(title: "Leadership & Engineering"),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final point in leadershipPoints)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 16,
                          color: AppConstats.orangeYellow,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(point, style: TextStyling().careerFonts),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class SkillCategoryCard extends StatelessWidget {
  final SkillCategory category;
  const SkillCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(category.icon, color: AppConstats.orangeYellow, size: 18),
              const SizedBox(width: 10),
              Text(
                category.title.toUpperCase(),
                style: TextStyling().siderheading.copyWith(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in category.items) PillBadge(label: item),
            ],
          ),
        ],
      ),
    );
  }
}

/// Compact visual: Presentation -> state mgmt -> domain -> repository -> data,
/// with Firebase / infra shown alongside.
class ArchitectureDiagram extends StatelessWidget {
  const ArchitectureDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < 760;
        final flow = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < architectureLayers.length; i++) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppConstats.onyx,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppConstats.charlestonGreen),
                ),
                child: Text(
                  architectureLayers[i],
                  textAlign: TextAlign.center,
                  style: TextStyling().titleNamesStyle,
                ),
              ),
              if (i != architectureLayers.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Center(
                    child: Icon(
                      Icons.arrow_downward,
                      size: 16,
                      color: AppConstats.orangeYellow,
                    ),
                  ),
                ),
            ],
          ],
        );

        final infra = GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SIDE INFRASTRUCTURE",
                style: TextStyling().siderheading.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final i in architectureInfra) PillBadge(label: i),
                ],
              ),
            ],
          ),
        );

        if (stacked) {
          return Column(
            children: [flow, const SizedBox(height: 16), infra],
          );
        }
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 3, child: flow),
              const SizedBox(width: 16),
              Expanded(flex: 2, child: infra),
            ],
          ),
        );
      },
    );
  }
}
