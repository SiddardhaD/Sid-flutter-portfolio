import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/download.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

/// Triggers a real, one-click download of the resume PDF served from the
/// `web/` root (a hidden `<a download>` anchor on web) — not just a new tab.
Future<void> openResume() async {
  try {
    final uri = Uri.base.resolve(AppUrls.resumePath);
    await triggerDownload(uri, "Siddardha_Devarayapalli_Resume.pdf");
  } catch (_) {
    // Resume not deployed yet — ignore rather than crash the UI.
  }
}

/// Opens the cover letter PDF in a new tab for viewing (not a forced
/// download — the browser's built-in PDF viewer renders it inline).
Future<void> openCoverLetter() async {
  try {
    final uri = Uri.base.resolve(AppUrls.coverLetterPath);
    await launchUrl(uri, webOnlyWindowName: '_blank');
  } catch (_) {}
}

Future<void> openUrl(String url) async {
  if (url.isEmpty) return;
  try {
    await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
  } catch (_) {}
}

/// Small rounded label used for tech / platform / use-case tags.
class PillBadge extends StatelessWidget {
  final String label;
  final Color? color;
  final bool outlined;
  const PillBadge({
    super.key,
    required this.label,
    this.color,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final accent = color ?? AppConstats.orangeYellow;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : AppConstats.raisinBlack,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: outlined ? accent.withOpacity(0.6) : AppConstats.onyx,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyling().chip.copyWith(
          color: outlined ? accent : AppConstats.quickSilver,
        ),
      ),
    );
  }
}

/// Primary / secondary CTA button used in sidebar, drawer and contact page.
class CtaButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  const CtaButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: filled ? AppConstats.orangeYellow : AppConstats.onyx,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 15,
                color: filled ? AppConstats.eerieBlack : AppConstats.lotion,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyling().titleNamesStyle.copyWith(
                    color: filled
                        ? AppConstats.eerieBlack
                        : AppConstats.lotion,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section title with the signature gold underline accent.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? caption;
  const SectionHeader({super.key, required this.title, this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyling().titleNamesStyle.copyWith(fontSize: 18)),
        Container(
          height: 4,
          width: 36,
          margin: const EdgeInsets.only(top: 8, bottom: 10),
          decoration: BoxDecoration(
            color: AppConstats.orangeYellow,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        if (caption != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(caption!, style: TextStyling().careerFonts),
          ),
      ],
    );
  }
}

/// A dark card wrapper reused across the new sections for a consistent,
/// low-glow "premium" surface.
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppConstats.blackOlive,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppConstats.onyx, width: 1),
      ),
      child: child,
    );
  }
}
