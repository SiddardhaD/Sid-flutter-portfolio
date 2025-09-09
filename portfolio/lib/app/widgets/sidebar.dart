import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 3,
      height: screenSize.height / 1.2,
      color: AppConstats.sidebarBackGround,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              AppConstats.profile,
            ), // add your image in assets
          ),
          const SizedBox(height: 20),
          const Text(
            "Siddardha Devarayapalli",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text("Flutter Developer", style: TextStyle(color: Colors.grey)),
          const Divider(height: 40, color: Colors.grey),

          Row(
            children: const [
              Icon(Icons.email, color: Colors.amber),
              SizedBox(width: 10),
              Text(
                "youremail@example.com",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Icon(Icons.phone, color: Colors.amber),
              SizedBox(width: 10),
              Text("+91 9876543210", style: TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Icon(Icons.location_on, color: Colors.amber),
              SizedBox(width: 10),
              Text("Hyderabad, India", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
