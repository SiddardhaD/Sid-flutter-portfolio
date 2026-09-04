import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:portfolio/app/widgets/common_widgets.dart';

/// Recruiter-friendly contact section with clear CTAs.
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: "Let's Connect",
            caption:
                "Open to Flutter roles and production mobile engineering work.",
          ),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ContactInfoCard(
                icon: Icons.email_outlined,
                title: AppConstats.email,
                value: AppConstats.userEmail,
                onTap: () => openUrl(AppUrls.mailtoUrl),
              ),
              ContactInfoCard(
                icon: Icons.phone_outlined,
                title: AppConstats.phone,
                value: AppConstats.userphone,
                onTap: () => openUrl(AppUrls.telUrl),
              ),
              ContactInfoCard(
                icon: Icons.location_on_outlined,
                title: AppConstats.location,
                value: AppConstats.userlocation,
                onTap: null,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              CtaButton(
                label: "Download Resume",
                icon: Icons.download_outlined,
                filled: true,
                onTap: openResume,
              ),
              CtaButton(
                label: "View Cover Letter",
                icon: Icons.picture_as_pdf_outlined,
                onTap: openCoverLetter,
              ),
              CtaButton(
                label: "View LinkedIn",
                icon: Icons.link,
                onTap: () => openUrl(AppUrls.linkedinUrl),
              ),
              CtaButton(
                label: "Contact Me",
                icon: Icons.mail_outline,
                onTap: () => openUrl(AppUrls.mailtoUrl),
              ),
              CtaButton(
                label: "GitHub",
                icon: Icons.code,
                onTap: () => openUrl(AppUrls.githubUrl),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;
  const ContactInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: GlassCard(
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppConstats.raisinBlack,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppConstats.orangeYellow, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyling().siderheading),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: TextStyling().siderAnswer,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
