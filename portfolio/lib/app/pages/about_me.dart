import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          MarkdownBody(
            data: AppConstats.aboutMe,
            styleSheet: MarkdownStyleSheet.fromTheme(
              Theme.of(context),
            ).copyWith(
              p: GoogleFonts.firaCode(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
              ),
              strong: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
              em: const TextStyle(
                color: Colors.greenAccent,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
