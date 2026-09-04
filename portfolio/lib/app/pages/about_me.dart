import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/app/widgets/common_widgets.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: isNarrow
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.only(left: 40, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarkdownBody(
            data: AppConstats.aboutMe,
            styleSheet: MarkdownStyleSheet.fromTheme(
              Theme.of(context),
            ).copyWith(
              p: GoogleFonts.inconsolata(
                color: Colors.white,
                fontSize: 16,
                height: 1.6,
              ),
              strong: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              AppConstats.careerHighLight,
              style: TextStyling().titleNamesStyle.copyWith(fontSize: 18),
            ),
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              for (final stat in careerStats)
                CareerNumbers(number: stat.value, label: stat.label),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 6),
            child: Text(
              AppConstats.proudOf,
              style: TextStyling().titleNamesStyle.copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(AppConstats.caption, style: TextStyling().careerFonts),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth > 760 ? 2 : 1;
              const spacing = 16.0;
              final cardWidth = columns == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth - spacing) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  for (final item in whatIBring)
                    SizedBox(
                      width: cardWidth,
                      child: BringCard(item: item),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class CareerNumbers extends StatelessWidget {
  final String number;
  final String label;
  const CareerNumbers({super.key, required this.label, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 150),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppConstats.onyx,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number,
            style: TextStyling().mainTitle.copyWith(
              fontSize: 20,
              color: AppConstats.orangeYellow,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyling().careerFonts),
        ],
      ),
    );
  }
}

class BringCard extends StatelessWidget {
  final BringItem item;
  const BringCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.index,
            style: TextStyling().mainTitle.copyWith(
              fontSize: 20,
              color: AppConstats.orangeYellow,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: TextStyling().sectionHeading.copyWith(fontSize: 14)),
                const SizedBox(height: 6),
                Text(item.desc, style: TextStyling().careerFonts.copyWith(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
