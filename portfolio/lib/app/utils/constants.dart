import 'dart:ui';

class AppConstats {
  //Images
  static const profile = "assets/images/profile.png";
  static const linkedin = "assets/images/linkedin.png";
  static const github = "assets/images/github.png";
  static const appstore = "assets/images/appstore.png";
  static const playstore = "assets/images/playstore.png";
  static const resumeIcon = "assets/images/appstore.png";

  static const String flutterImage = "assets/images/skills/flutter.png";
  static const String androidImage = "assets/images/skills/android.png";
  static const String firebaseImage = "assets/images/skills/firebase.png";
  static const String iosImage = "assets/images/skills/ios.png";

  //project images (only used where a real screenshot exists)
  static const String project1Image1 = "assets/images/projects/project1_1.webp";
  static const String project1Image2 = "assets/images/projects/project1_2.webp";
  static const String project2Image1 = "assets/images/projects/project2_1.webp";
  static const String project2Image2 = "assets/images/projects/project2_2.webp";
  static const String project3Image1 = "assets/images/projects/project3_1.webp";
  static const String project3Image2 = "assets/images/projects/project3_2.webp";
  static const String project4Image1 = "assets/images/projects/project4_1.png";
  static const String project4Image2 = "assets/images/projects/project4_2.png";
  static const String project1 = "assets/images/projects/project1.webp";
  static const String project2 = "assets/images/projects/project2.webp";
  static const String project3 = "assets/images/projects/project3.webp";
  static const String project4 = "assets/images/projects/project4.webp";

  //blogs
  static const String blog1 = "assets/images/blog/blog1.png";
  static const String blog2 = "assets/images/blog/blog2.png";
  static const String blog3 = "assets/images/blog/blog3.png";

  //Colors — dark premium palette, preserved
  static const Color eerieBlack = Color(0XFF1E1E1F);
  static const Color onyx = Color(0XFF383838);
  static const Color neonGreen = Color(0XFF3AFF16);
  static const Color lotion = Color(0XFFFAFAFA);
  static const Color raisinBlack = Color(0XFF202022);
  static const Color blackOlive = Color(0XFF3A3A3A);
  static const Color orangeYellow = Color(0XFFFCD06A);
  static const Color quickSilver = Color(0XFF9F9F9F);
  static const Color charlestonGreen = Color(0XFF282829);

  //Profile
  static const String username = "Siddardha Devarayapalli";
  static const String userRole = "Senior / Lead Flutter Engineer";
  static const String userSubtitle =
      "Building production mobile & web applications with Flutter, scalable architecture, and AI-assisted development.";
  static const String userEmail = "siddardhadevarayapalli@gmail.com";
  static const String userphone = "+91 9985091823";
  static const String userlocation = "Chennai, Tamil Nadu, India";
  static const String email = "EMAIL";
  static const String phone = "PHONE";
  static const String location = "LOCATION";

  static const String aboutMe = '''
I'm **Siddardha Devarayapalli**, a **Senior / Lead Flutter Engineer** with **7+ years** of software development experience, building and shipping production applications across **Android, iOS, and Web**.

My core expertise is **Flutter and Dart**, with strong experience in mobile architecture, REST APIs, Firebase, WebSockets, third-party SDK integrations, payments, native platform integrations, debugging, performance optimization, and production releases.

I started my career in **IoT engineering**, working with microcontrollers, sensors, embedded systems, and real-time applications. That foundation gave me strong exposure to hardware-software integration and helped shape my approach to building reliable applications.

Over the years, I moved into mobile and web application development and have worked across e-commerce, POS, HRMS, hospitality, food-tech, consumer applications, and IoT.

I also use AI tools such as **Claude** and **Cursor** extensively in my development workflow for code analysis, debugging, refactoring, implementation, and productivity. I'm currently expanding into **Python, Generative AI, LLMs, RAG, Ollama, and Hugging Face** to build AI-enabled applications.
''';

  static const String careerHighLight = "Career Highlights";
  static const String skills = "Skills";
  static const String proudOf = "What I Bring";
  static const String caption =
      "A compact look at how I work — from shipping features to owning production.";
  static const String featureWork = "Featured Project";
}

class AppUrls {
  static const String linkedinUrl =
      "https://www.linkedin.com/in/siddardha-devarayapalli-80359122/";
  static const String githubUrl = "https://github.com/SiddardhaD";
  static const String portfolioUrl =
      "https://siddardhad.github.io/Sid-flutter-portfolio/";

  /// Relative to the web root (see `web/` folder — everything there is copied
  /// verbatim into the build output). Drop the resume PDF at
  /// `web/resume/Siddardha_Devarayapalli_Resume.pdf` in the repo for this
  /// link to resolve; it will 404 until that file is added.
  static const String resumePath =
      "resume/Siddardha_Devarayapalli_Resume.pdf";

  /// Same convention — drop the cover letter PDF at
  /// `web/resume/Siddardha_Devarayapalli_Cover_Letter.pdf`.
  static const String coverLetterPath =
      "resume/Siddardha_Devarayapalli_Cover_Letter.pdf";
  static const String mailtoUrl = "mailto:siddardhadevarayapalli@gmail.com";
  static const String telUrl = "tel:+919985091823";
}

/// Career highlight stat cards shown on the About page.
class CareerStat {
  final String value;
  final String label;
  const CareerStat(this.value, this.label);
}

const List<CareerStat> careerStats = [
  CareerStat("+7", "YEARS EXPERIENCE"),
  CareerStat("10+", "PRODUCTION APPLICATIONS"),
  CareerStat("ANDROID", "iOS & WEB"),
];

/// "What I Bring" — recruiter-friendly summary blocks.
class BringItem {
  final String index;
  final String title;
  final String desc;
  const BringItem(this.index, this.title, this.desc);
}

const List<BringItem> whatIBring = [
  BringItem(
    "01",
    "Production Mobile Engineering",
    "Building and shipping Android and iOS applications with Flutter.",
  ),
  BringItem(
    "02",
    "Architecture & Scalability",
    "Clean Architecture, state management, reusable components and maintainable code.",
  ),
  BringItem(
    "03",
    "End-to-End Ownership",
    "From requirements and development to debugging, testing and production release.",
  ),
  BringItem(
    "04",
    "Integrations",
    "REST APIs, Firebase, payments, third-party SDKs, native integrations and Unity.",
  ),
  BringItem(
    "05",
    "Technical Leadership",
    "Cross-functional collaboration, mentoring and technical decision-making.",
  ),
  BringItem(
    "06",
    "AI-Assisted Development",
    "Using Claude and Cursor to improve engineering productivity, debugging and code quality.",
  ),
];

/// Top-level navigation labels, shared by desktop nav bar and mobile drawer.
const List<String> navLabels = [
  "ABOUT",
  "EXPERIENCE",
  "SKILLS",
  "WORK",
  "AI",
  "BLOG",
  "CONTACT",
];

const List<String> navPageTitles = [
  "About Me",
  "Experience",
  "Skills",
  "Work",
  "AI-Assisted Engineering",
  "Blog",
  "Contact",
];
