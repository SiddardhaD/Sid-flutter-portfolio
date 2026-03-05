import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileAboutMe extends StatefulWidget {
  const MobileAboutMe({super.key});

  @override
  State<MobileAboutMe> createState() => _MobileAboutMeState();
}

class _MobileAboutMeState extends State<MobileAboutMe> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
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
                  fontSize: 14,
                  height: 1.5,
                ),
                strong: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 20),
              child: Text(
                AppConstats.careerHighLight,
                style: TextStyling().titleNamesStyle.copyWith(fontSize: 16),
              ),
            ),
            Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                MobileCareerNumbers(
                  number: "+6",
                  label: AppConstats.experience,
                ),
                MobileCareerNumbers(number: "+15", label: AppConstats.projects),
                MobileCareerNumbers(
                  number: "+9",
                  label: AppConstats.appDeployments,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 20),
              child: Text(
                AppConstats.skills,
                style: TextStyling().titleNamesStyle.copyWith(fontSize: 16),
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                MobileSkillsName(
                  image: AppConstats.flutterImage,
                  label: AppConstats.flutter,
                ),
                MobileSkillsName(
                  image: AppConstats.androidImage,
                  label: AppConstats.android,
                ),
                MobileSkillsName(
                  image: AppConstats.iosImage,
                  label: AppConstats.ios,
                ),
                MobileSkillsName(
                  image: AppConstats.figmaImage,
                  label: AppConstats.figma,
                ),
                MobileSkillsName(
                  image: AppConstats.firebaseImage,
                  label: AppConstats.firebase,
                ),
                MobileSkillsName(
                  image: AppConstats.nodeImage,
                  label: AppConstats.node,
                ),
                MobileSkillsName(
                  image: AppConstats.postmanImage,
                  label: AppConstats.postman,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                AppConstats.proudOf,
                style: TextStyling().titleNamesStyle.copyWith(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                AppConstats.caption,
                style: TextStyling().careerFonts.copyWith(fontSize: 12),
              ),
            ),
            Column(
              children: [
                MobileProjectProudOf(
                  logo: AppConstats.project1,
                  image1: AppConstats.project1Image1,
                  image2: AppConstats.project1Image2,
                  label: AppConstats.project1Name,
                  des: AppConstats.project1Des,
                  appStoreUrl:
                      "https://apps.apple.com/ua/app/vibhohcm-app/id6463864220",
                  playStoreUrl: "",
                ),
                MobileProjectProudOf(
                  logo: AppConstats.project2,
                  image1: AppConstats.project2Image1,
                  image2: AppConstats.project2Image2,
                  label: AppConstats.project2Name,
                  des: AppConstats.project2Des,
                  appStoreUrl: "",
                  playStoreUrl:
                      "https://play.google.com/store/apps/details?id=com.mooms.foood&hl=en_IN",
                ),
                MobileProjectProudOf(
                  logo: AppConstats.project3,
                  image1: AppConstats.project3Image1,
                  image2: AppConstats.project3Image2,
                  label: AppConstats.project3Name,
                  des: AppConstats.project3Des,
                  appStoreUrl: "",
                  playStoreUrl:
                      "https://play.google.com/store/apps/details?id=com.momfoood.sellers&hl=en_IN",
                ),
                MobileProjectProudOf(
                  logo: AppConstats.project4,
                  image1: AppConstats.project4Image1,
                  image2: AppConstats.project4Image2,
                  label: AppConstats.project4Name,
                  des: AppConstats.project4Des,
                  appStoreUrl:
                      "https://apps.apple.com/us/app/krispy-kreme/id482752836",
                  playStoreUrl:
                      "https://play.google.com/store/apps/details?id=com.krispykreme.HotLights&hl=en_IN",
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class MobileCareerNumbers extends StatelessWidget {
  final String number;
  final String label;
  const MobileCareerNumbers({
    super.key,
    required this.label,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppConstats.onyx,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: TextStyling().mainTitle.copyWith(fontSize: 18)),
          SizedBox(height: 5),
          Text(label, style: TextStyling().careerFonts.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}

class MobileSkillsName extends StatelessWidget {
  final String image;
  final String label;
  const MobileSkillsName({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppConstats.onyx,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
            color: AppConstats.orangeYellow,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyling().titleNamesStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class MobileProjectProudOf extends StatelessWidget {
  final String logo;
  final String image1;
  final String image2;
  final String label;
  final String des;
  final String appStoreUrl;
  final String playStoreUrl;

  const MobileProjectProudOf({
    super.key,
    required this.label,
    required this.image1,
    required this.image2,
    required this.logo,
    required this.des,
    required this.appStoreUrl,
    required this.playStoreUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppConstats.onyx,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(logo, height: 35, width: 35),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: TextStyling().mainTitle.copyWith(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          MobileReadMoreText(
            des,
            style: TextStyling().careerFonts.copyWith(fontSize: 12),
            trimLines: 3,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              if (playStoreUrl.isNotEmpty)
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(playStoreUrl));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppConstats.blackOlive,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: AppConstats.orangeYellow.withValues(
                            alpha: 0.3,
                          ),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      AppConstats.playstore,
                      height: 24,
                      width: 24,
                      color: AppConstats.orangeYellow,
                    ),
                  ),
                ),
              SizedBox(width: 15),
              if (appStoreUrl.isNotEmpty)
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(appStoreUrl));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppConstats.blackOlive,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: AppConstats.orangeYellow.withValues(
                            alpha: 0.3,
                          ),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      AppConstats.appstore,
                      height: 24,
                      width: 24,
                      color: AppConstats.orangeYellow,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image1,
              height: screenSize.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class MobileReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int trimLines;

  const MobileReadMoreText(
    this.text, {
    super.key,
    this.style,
    this.trimLines = 3,
  });

  @override
  _MobileReadMoreTextState createState() => _MobileReadMoreTextState();
}

class _MobileReadMoreTextState extends State<MobileReadMoreText> {
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
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    _readMore ? "Read more" : "Read less",
                    style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppConstats.orangeYellow,
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
