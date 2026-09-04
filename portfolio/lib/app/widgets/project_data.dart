/// Central project portfolio data — shared by the responsive Work page.
/// Only real store/app links are included; nothing here is invented.
class Project {
  final String name;
  final String shortDes;
  final String fullDes;
  final String role;
  final List<String> technologies;
  final List<String> platforms;
  final List<String> highlights;
  final String appStoreUrl;
  final String playStoreUrl;
  final String githubUrl;
  final String? image;
  final List<String> gallery;
  final bool featured;

  const Project({
    required this.name,
    required this.shortDes,
    required this.fullDes,
    required this.role,
    required this.technologies,
    required this.platforms,
    required this.highlights,
    this.appStoreUrl = "",
    this.playStoreUrl = "",
    this.githubUrl = "",
    this.image,
    this.gallery = const [],
    this.featured = false,
  });

  bool get hasLink =>
      appStoreUrl.isNotEmpty || playStoreUrl.isNotEmpty || githubUrl.isNotEmpty;
}

const List<Project> projects = [
  Project(
    name: "Collectors Card",
    shortDes:
        "Production mobile app for collector card management with real-time sync and Unity integration.",
    fullDes:
        "Collectors Card is a production mobile application for Android and iOS. I worked on the application as a Lead Flutter Developer, contributing across UI, architecture, API integration, state management, Unity integration, production debugging, performance optimization, analytics, monitoring and release management.",
    role: "Lead Flutter Developer",
    technologies: [
      "Flutter",
      "Dart",
      "Firebase",
      "Sentry",
      "Amplitude",
      "REST APIs",
      "Unity Integration",
    ],
    platforms: ["Android", "iOS"],
    highlights: [
      "Feature development",
      "Architecture",
      "API integration",
      "State management",
      "Unity integration",
      "Production debugging",
      "Performance optimization",
      "Release management",
    ],
    appStoreUrl: "https://apps.apple.com/us/app/collectors-card/id6754694464",
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.collectors.card&hl=en_IN",
    image: "assets/images/projects/project5.png",
    gallery: [
      "assets/images/projects/project5_1.png",
      "assets/images/projects/project5_2.png",
      "assets/images/projects/project5_3.png",
      "assets/images/projects/project5_4.png",
    ],
    featured: true,
  ),
  Project(
    name: "ChargeSavvy POS",
    shortDes:
        "Restaurant & club POS handling orders, tabs, inventory and payment workflows.",
    fullDes:
        "ChargeSavvy is a restaurant and club POS application designed to manage orders, tabs, inventory, discounts, fees and payment workflows.",
    role: "Associate Tech Lead",
    technologies: [
      "Flutter",
      "Dart",
      "REST APIs",
      "Real-time APIs",
      "Payment Integrations",
    ],
    platforms: ["Android", "iOS"],
    highlights: [
      "Order management",
      "Inventory",
      "Tabs",
      "Merging and transfers",
      "Discounts and fees",
      "PayLater",
      "PreAuth",
      "Real-time API synchronization",
      "Role-based workflows",
    ],
    appStoreUrl: "https://apps.apple.com/us/app/chargesavvy-pos/id1673276764",
  ),
  Project(
    name: "Krispy Kreme",
    shortDes:
        "Flagship rewards app for the doughnut brand — coupons, promotions and releases.",
    fullDes:
        "Worked on the Krispy Kreme mobile application, contributing to Flutter feature development, promotions, production issue resolution, stability improvements and release support.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Dart", "REST APIs"],
    platforms: ["Android", "iOS"],
    highlights: [
      "Auto-Apply Coupons",
      "Offers & Promotions",
      "Production debugging",
      "Performance / stability",
      "Mobile releases",
    ],
    appStoreUrl: "https://apps.apple.com/us/app/krispy-kreme/id482752836",
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.krispykreme.HotLights&hl=en_IN",
    image: "assets/images/projects/project4.webp",
    gallery: [
      "assets/images/projects/project4_1.png",
      "assets/images/projects/project4_2.png",
    ],
  ),
  Project(
    name: "Vibho HCM",
    shortDes:
        "HRMS app streamlining employee and organizational workflows.",
    fullDes:
        "Vibho HCM is an HRMS application designed to simplify and streamline employee and organizational workflows.",
    role: "Flutter Developer",
    technologies: ["Flutter", "BLoC", "Firebase", "REST APIs"],
    platforms: ["Android", "iOS"],
    highlights: [
      "Employee management",
      "Attendance",
      "Leave management",
      "Employee self-service",
      "HR workflows",
      "API integration",
    ],
    appStoreUrl: "https://apps.apple.com/ua/app/vibhohcm-app/id6463864220",
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.vibho.hcm&hl=en_IN",
    image: "assets/images/projects/project1.webp",
    gallery: [
      "assets/images/projects/project1_1.webp",
      "assets/images/projects/project1_2.webp",
    ],
  ),
  Project(
    name: "Stellar HR",
    shortDes: "Self-service employee management app.",
    fullDes:
        "Stellar HR is a self-service employee management application built as part of the PhotonX Tech project portfolio, focused on smooth UI/UX and robust backend integration.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Dart", "BLoC", "MVC", "Node.js", "MySQL"],
    platforms: ["Android", "iOS"],
    highlights: ["Employee self-service", "UI/UX", "Backend integration"],
  ),
  Project(
    name: "MomsFoood Customer",
    shortDes: "Food discovery and home-cooked meal ordering app.",
    fullDes:
        "MomsFood brings fresh, homemade meals to the doorstep — browse restaurants and menus and order your favorite dishes with just a few taps.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Dart", "REST APIs"],
    platforms: ["Android"],
    highlights: [
      "Restaurant & menu discovery",
      "Ordering / delivery workflows",
    ],
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.mooms.foood&hl=en_IN",
    image: "assets/images/projects/project2.webp",
    gallery: [
      "assets/images/projects/project2_1.webp",
      "assets/images/projects/project2_2.webp",
    ],
  ),
  Project(
    name: "MomsFoood Seller",
    shortDes: "Seller app for home chefs and restaurants to go digital.",
    fullDes:
        "MomsFood Seller empowers home chefs and restaurants to manage their online menu, pricing and orders with a simple, powerful app.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Dart", "REST APIs"],
    platforms: ["Android"],
    highlights: ["Menu management", "Pricing", "Order management"],
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.momfoood.sellers&hl=en_IN",
    image: "assets/images/projects/project3.webp",
    gallery: [
      "assets/images/projects/project3_1.webp",
      "assets/images/projects/project3_2.webp",
    ],
  ),
  Project(
    name: "Briscart",
    shortDes:
        "Unified shopping app & web app integrating multiple stores.",
    fullDes:
        "Briscart Shopping App & WebApp is a unified shopping platform integrating multiple stores with advanced product search and referral features.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Python Flask", "MySQL", "REST APIs"],
    platforms: ["Android", "iOS", "Web"],
    highlights: [
      "Multi-store integration",
      "Advanced product search",
      "Referral features",
    ],
  ),
  Project(
    name: "Konnect Homes",
    shortDes: "SmartHome app to control and schedule appliances.",
    fullDes:
        "Konnect Homes is a SmartHome solution to control and schedule appliances, built with a Flutter frontend and a Flask + MySQL backend.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Python Flask", "MySQL", "Smart-Home Integrations"],
    platforms: ["Android", "iOS"],
    highlights: ["Appliance control", "Scheduling", "Smart-home integrations"],
  ),
  Project(
    name: "Simplifarms IoT",
    shortDes: "Agricultural IoT system for smart farming.",
    fullDes:
        "Simplifarms is a smart farming product integrating IoT devices with mobile applications for efficient agricultural management, working with ESP controllers, sensors and field monitoring.",
    role: "IoT Specialist",
    technologies: ["ESP Controllers", "Sensors", "Embedded Systems", "IoT"],
    platforms: ["IoT", "Android"],
    highlights: [
      "Hardware-software integration",
      "Irrigation & water-pumping systems",
      "Real-time data & device control",
    ],
  ),
  Project(
    name: "Sunray Resort Mapping",
    shortDes: "Resort mapping application.",
    fullDes:
        "Sunray Resort Mapping is a resort mapping application built as part of the PhotonX Tech project portfolio.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Dart"],
    platforms: ["Android", "iOS"],
    highlights: ["Flutter development"],
  ),
  Project(
    name: "EmpireAI",
    shortDes: "Trading platform with real-time analytics.",
    fullDes:
        "EmpireAI is a trading platform with real-time analytics, built as part of the PhotonX Tech project portfolio.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Dart", "GetX", "Node.js"],
    platforms: ["Android", "iOS"],
    highlights: ["Real-time analytics UI", "Backend integration"],
  ),
  Project(
    name: "QuickNews",
    shortDes: "Fast, multimedia-enabled news application.",
    fullDes:
        "QuickNews is a fast, multimedia-enabled news application designed for quick updates and simplicity.",
    role: "Flutter Developer",
    technologies: ["Flutter", "Dart"],
    platforms: ["Android", "iOS"],
    highlights: ["Multimedia news feed", "Simple, fast UX"],
  ),
];
