import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/app/widgets/common_widgets.dart';
import 'package:portfolio/app/widgets/project_data.dart';

/// Responsive project portfolio — works unchanged on desktop and mobile.
/// Collectors Card is pinned first as the featured project.
class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${projects.length} projects across mobile, web and IoT — production apps first.",
            style: TextStyling().careerFonts,
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final columns = width > 980 ? 3 : (width > 620 ? 2 : 1);
              const spacing = 16.0;
              final cardWidth =
                  (width - spacing * (columns - 1)) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  for (final project in projects)
                    SizedBox(
                      width: cardWidth,
                      child: ProjectCard(project: project),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (project.image != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    project.image!,
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  project.name,
                  style: TextStyling().mainTitle.copyWith(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (project.featured)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: PillBadge(
                    label: AppConstats.featureWork,
                    outlined: true,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            project.shortDes,
            style: TextStyling().careerFonts.copyWith(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final p in project.platforms) PillBadge(label: p),
              for (final t in project.technologies.take(3))
                PillBadge(label: t, outlined: true),
              if (project.technologies.length > 3)
                PillBadge(label: "+${project.technologies.length - 3}"),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: CtaButton(
              label: "View Details",
              icon: Icons.arrow_forward,
              filled: true,
              onTap: () => showProjectDetails(context, project),
            ),
          ),
        ],
      ),
    );
  }
}

void showProjectDetails(BuildContext context, Project project) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.6),
    builder: (context) {
      return Dialog(
        backgroundColor: AppConstats.eerieBlack,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppConstats.onyx, width: 1),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560, maxHeight: 640),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        project.name,
                        style: TextStyling().mainTitle,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: AppConstats.quickSilver),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final p in project.platforms) PillBadge(label: p),
                  ],
                ),
                const SizedBox(height: 16),
                Text(project.fullDes, style: TextStyling().careerFonts),
                if (project.gallery.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: project.gallery.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, i) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          project.gallery[i],
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Text("Role", style: TextStyling().sectionHeading.copyWith(fontSize: 13)),
                const SizedBox(height: 8),
                Text(project.role, style: TextStyling().careerFonts),
                const SizedBox(height: 20),
                Text(
                  "Key Contribution",
                  style: TextStyling().sectionHeading.copyWith(fontSize: 13),
                ),
                const SizedBox(height: 8),
                for (final h in project.highlights)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 5,
                          color: AppConstats.orangeYellow,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(h, style: TextStyling().careerFonts),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 12),
                Text(
                  "Technologies",
                  style: TextStyling().sectionHeading.copyWith(fontSize: 13),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final t in project.technologies)
                      PillBadge(label: t, outlined: true),
                  ],
                ),
                if (project.hasLink) ...[
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      if (project.playStoreUrl.isNotEmpty)
                        CtaButton(
                          label: "Play Store",
                          icon: Icons.shop,
                          onTap: () => openUrl(project.playStoreUrl),
                        ),
                      if (project.appStoreUrl.isNotEmpty)
                        CtaButton(
                          label: "App Store",
                          icon: Icons.apple,
                          onTap: () => openUrl(project.appStoreUrl),
                        ),
                      if (project.githubUrl.isNotEmpty)
                        CtaButton(
                          label: "GitHub",
                          icon: Icons.code,
                          onTap: () => openUrl(project.githubUrl),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    },
  );
}
