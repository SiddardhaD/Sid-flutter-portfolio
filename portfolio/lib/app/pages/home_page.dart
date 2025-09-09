import 'package:flutter/material.dart';
import 'package:portfolio/app/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // dark theme
      body: Row(children: [const SideBar()]),
    );
  }
}
