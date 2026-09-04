import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/app/widgets/common_widgets.dart';

const String aiIntro =
    "Over the last 2+ years, I have incorporated AI tools into my daily software development workflow using Claude and Cursor.";

const List<Map<String, dynamic>> aiUseCases = [
  {"label": "Code Analysis", "icon": Icons.search},
  {"label": "Debugging", "icon": Icons.bug_report_outlined},
  {"label": "Refactoring", "icon": Icons.build_outlined},
  {"label": "Implementation Assistance", "icon": Icons.integration_instructions_outlined},
  {"label": "Documentation", "icon": Icons.description_outlined},
  {"label": "Problem Solving", "icon": Icons.psychology_outlined},
  {"label": "Development Productivity", "icon": Icons.speed_outlined},
];

const List<String> aiExploring = [
  "Python",
  "LLMs",
  "RAG",
  "Ollama",
  "Hugging Face",
  "Generative AI",
  "AI-powered Applications",
];

/// AI-Assisted Engineering — positioned as an expanding practice area,
/// not as AI engineering expertise.
class AiPage extends StatelessWidget {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: "AI-Assisted Engineering"),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(aiIntro, style: TextStyling().careerFonts),
                const SizedBox(height: 20),
                Text(
                  "USE CASES",
                  style: TextStyling().siderheading.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final u in aiUseCases)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppConstats.onyx,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              u["icon"] as IconData,
                              size: 16,
                              color: AppConstats.orangeYellow,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                u["label"] as String,
                                style: TextStyling().titleNamesStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CURRENTLY EXPLORING",
                  style: TextStyling().siderheading.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 6),
                Text(
                  "Expanding into AI-enabled application development — not positioned as AI engineering expertise.",
                  style: TextStyling().careerFonts.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final e in aiExploring)
                      PillBadge(label: e, outlined: true),
                  ],
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
