import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/app/utils/styles.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 20),
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
                height: 1.5,
              ),
              strong: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 40),
            child: Text(
              AppConstats.careerHighLight,
              style: TextStyling().titleNamesStyle.copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                CareerNumbers(number: "+3", label: AppConstats.experience),
                CareerNumbers(number: "+15", label: AppConstats.projects),
                CareerNumbers(number: "+4", label: AppConstats.appDeployments),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 40),
            child: Text(
              AppConstats.skills,
              style: TextStyling().titleNamesStyle.copyWith(fontSize: 18),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  SkillsName(
                    image: AppConstats.flutterImage,
                    label: AppConstats.flutter,
                  ),
                  SkillsName(
                    image: AppConstats.androidImage,
                    label: AppConstats.android,
                  ),
                  SkillsName(
                    image: AppConstats.iosImage,
                    label: AppConstats.ios,
                  ),
                  SkillsName(
                    image: AppConstats.figmaImage,
                    label: AppConstats.figma,
                  ),
                  SkillsName(
                    image: AppConstats.firebaseImage,
                    label: AppConstats.firebase,
                  ),
                  SkillsName(
                    image: AppConstats.nodeImage,
                    label: AppConstats.node,
                  ),
                  SkillsName(
                    image: AppConstats.postmanImage,
                    label: AppConstats.postman,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              AppConstats.proudOf,
              style: TextStyling().titleNamesStyle.copyWith(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 40),
            child: Text(AppConstats.caption, style: TextStyling().careerFonts),
          ),
          Scrollbar(
            controller: _controller,
            thumbVisibility: true, // Always show scrollbar
            trackVisibility: true,
            scrollbarOrientation:
                ScrollbarOrientation.bottom, // 👈 Bottom scrollbar
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    ProjectProudOf(
                      logo: AppConstats.project1,
                      image1: AppConstats.project1Image1,
                      image2: AppConstats.project1Image2,
                      label: AppConstats.project1Name,
                      des: AppConstats.project1Des,
                    ),
                    ProjectProudOf(
                      logo: AppConstats.project2,
                      image1: AppConstats.project2Image1,
                      image2: AppConstats.project2Image2,
                      label: AppConstats.project2Name,
                      des: AppConstats.project2Des,
                    ),
                    ProjectProudOf(
                      logo: AppConstats.project3,
                      image1: AppConstats.project3Image1,
                      image2: AppConstats.project3Image2,
                      label: AppConstats.project3Name,
                      des: AppConstats.project3Des,
                    ),
                    ProjectProudOf(
                      logo: AppConstats.project4,
                      image1: AppConstats.project4Image1,
                      image2: AppConstats.project4Image2,
                      label: AppConstats.project4Name,
                      des: AppConstats.project4Des,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: TextStyling().mainTitle.copyWith(fontSize: 20)),
          Text(label, style: TextStyling().careerFonts),
        ],
      ),
    );
  }
}

class SkillsName extends StatelessWidget {
  final String image;
  final String label;
  const SkillsName({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppConstats.onyx,
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 25,
            width: 25,
            color: AppConstats.orangeYellow,
          ),
          SizedBox(width: 10),
          Text(label, style: TextStyling().titleNamesStyle),
        ],
      ),
    );
  }
}

class ProjectProudOf extends StatelessWidget {
  final String logo;
  final String image1;
  final String image2;
  final String label;
  final String des;
  const ProjectProudOf({
    super.key,
    required this.label,
    required this.image1,
    required this.image2,
    required this.logo,
    required this.des,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 5,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppConstats.onyx,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(logo, height: 40, width: 40),
              SizedBox(width: 10),
              Text(label, style: TextStyling().mainTitle),
            ],
          ),
          SizedBox(height: 20),
          ReadMoreText(des, style: TextStyling().careerFonts, trimLines: 4),
          SizedBox(height: 20),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppConstats.orangeYellow.withOpacity(0.6),
                        offset: const Offset(-1, -1),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: AppConstats.blackOlive.withOpacity(0.1),
                        offset: const Offset(0, 0),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppConstats.playstore,
                    height: 30,
                    width: 30,
                    color: AppConstats.orangeYellow,
                  ),
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppConstats.orangeYellow.withOpacity(0.6),
                        offset: const Offset(-1, -1),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: AppConstats.blackOlive.withOpacity(0.1),
                        offset: const Offset(0, 0),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppConstats.appstore,
                    height: 30,
                    width: 30,
                    color: AppConstats.orangeYellow,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: screenSize.height / 2,
            padding: EdgeInsets.only(top: 20),
            child: Image.asset(image1),
          ),
        ],
      ),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int trimLines;

  const ReadMoreText(this.text, {super.key, this.style, this.trimLines = 3});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = widget.style ?? const TextStyle(fontSize: 14);

    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: widget.text, style: defaultStyle);
        final tp = TextPainter(
          text: span,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final exceeded = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: defaultStyle,
              maxLines: _readMore ? widget.trimLines : null,
              overflow:
                  _readMore ? TextOverflow.ellipsis : TextOverflow.visible,
              textAlign: TextAlign.justify,
            ),
            if (exceeded)
              InkWell(
                onTap: () => setState(() => _readMore = !_readMore),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    _readMore ? "Read more" : "Read less",
                    style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
