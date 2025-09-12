import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';
import 'package:portfolio/app/utils/styles.dart';

class ExperienceTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> experiences = [
    {
      "role": "Sr Flutter Developer",
      "company": "Shervani Tech Hub Pvt Ltd (Payroll) | Client: WWT",
      "date": "Mar 2025 — Present",
      "service": true,
      "desc":
          "Contributing to the Krispy Kreme Mobile Application, a flagship app for the USA-based doughnut brand, by implementing features like Auto-Apply Coupons to enhance checkout and increase conversions. Improved the Offers & Promotions UI to deliver a seamless and brand-consistent user experience, while collaborating with cross-functional teams to resolve critical bugs, optimize performance, and ensure production-ready releases. Actively involved in feature rollouts, app maintenance, and enhancements across both Android and iOS platforms.",
    },
    {
      "role": "Associate Tech Lead & Flutter Developer",
      "company": "Ideyalbs",
      "date": "Oct 2024 — Mar 2025",
      "service": true,
      "desc":
          "Spearheaded the development of ChargeSavvy, a comprehensive POS application for restaurants and clubs with advanced inventory, order, and payment management features. The app supports multi-role access, real-time data synchronization via APIs, and secure workflows.",
    },
    {
      "role": "Flutter Developer",
      "company": "PhotonX Tech Pvt Ltd",
      "date": "July 2023 — Aug 2024",
      "service": true,
      "desc":
          "Led the development of multiple applications including Stellar HR, a self-service employee management app; EmpireAI, a trading platform with real-time analytics; and Vibho HCM, a human capital management tool (BLoC-based). Ensuring smooth UI/UX and robust backend integration. Also created QuickNews, a fast, multimedia-enabled news application designed for quick updates and simplicity.",
    },
    {
      "role": "Flutter Developer",
      "company": "Infiyoda Solutions Pvt Ltd",
      "date": "July 2021 — Dec 2022",
      "service": false,
      "desc":
          "Developed Briscart Shopping App & WebApp, a unified shopping platform integrating multiple stores with advanced product search and referral features. Also built Konnect Homes, a SmartHome solution to control and schedule appliances, working on both frontend in Flutter and backend using Flask with MySQL.",
    },
    {
      "role": "IOT Specialist",
      "company": "Inforepos Pvt Ltd",
      "date": "Jan 2019 — Jun 2021",
      "service": false,
      "desc":
          "At Inforepos Pvt Ltd, I worked as an IoT Specialist contributing to the design and development of IoT-based agricultural solutions. One of the key projects was Simplifarms, an innovative smart farming product that integrates IoT devices with mobile applications for efficient agricultural management.",
    },
  ];

  ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Timeline(
            indicatorSize: 20,
            itemGap: 10,
            lineColor: AppConstats.charlestonGreen,
            indicators: <Widget>[
              for (int i = 0; i < experiences.length; i++) ...[
                DotWidget(index: i, length: experiences.length),
              ],
            ],
            children: [
              for (int i = 0; i < experiences.length; i++) ...[
                ExperienceWidget(
                  role: experiences[i]["role"],
                  company: experiences[i]["company"],
                  date: experiences[i]["date"],
                  service: experiences[i]["service"],
                  des: experiences[i]["desc"],
                  index: i,
                ),
              ],
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Timeline extends StatelessWidget {
  const Timeline({
    Key? key,
    required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 4.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = Colors.grey,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.lineGap = 4.0,
    this.indicatorColor = Colors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
  }) : itemCount = children.length,
       assert(itemGap >= 0),
       assert(lineGap >= 0),
       assert(indicators == null || children.length == indicators.length),
       super(key: key);

  final List<Widget> children;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget>? indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController? controller;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double lineGap;
  final double indicatorSize;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];
        final _indicators = indicators;

        Widget? indicator;
        if (_indicators != null) {
          indicator = _indicators[index];
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: indicator,
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    required this.hideDefaultIndicator,
    required this.indicatorColor,
    required this.indicatorStyle,
    required this.indicatorSize,
    required this.lineGap,
    required this.strokeCap,
    required this.strokeWidth,
    required this.style,
    required this.lineColor,
    required this.isFirst,
    required this.isLast,
    required this.itemGap,
  }) : linePaint =
           Paint()
             ..color = lineColor
             ..strokeCap = strokeCap
             ..strokeWidth = strokeWidth
             ..style = style,
       circlePaint =
           Paint()
             ..color = indicatorColor
             ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - halfItemGap));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemGap));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.centerLeft(Offset(indicatorRadius, 0));

      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class DotWidget extends StatelessWidget {
  final int index;
  final int length;
  const DotWidget({super.key, required this.index, required this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(41, 198, 196, 196),
        shape: BoxShape.circle,
      ),
      child: Container(
        height: 4,
        width: 4,
        decoration: BoxDecoration(
          color: AppConstats.orangeYellow,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  final String role;
  final String company;
  final String date;
  final bool service;
  final String des;
  final int index;
  const ExperienceWidget({
    super.key,
    required this.company,
    required this.date,
    required this.des,
    required this.role,
    required this.service,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppConstats.blackOlive,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(role, style: TextStyling().userName.copyWith(fontSize: 14)),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(company, style: TextStyling().careerFonts),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              date,
              style: TextStyling().aboutMe.copyWith(
                color: AppConstats.orangeYellow,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10),
            child: Text(
              des,
              style: TextStyling().careerFonts.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
