import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 25),

            // FOTO PROFILE
            CircleAvatar(
              radius: 65,
              backgroundColor: const Color(0xFFE8F3F8),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: const NetworkImage('assets/images/monyed.jpg'),
              ),
            ),

            const SizedBox(height: 15),

            // NAMA
            const Text(
              'Muhammad Rafsanjani',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              'Your Profile',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),

            const SizedBox(height: 35),

            // EMAIL
            profileItem(
              icon: Icons.email_outlined,
              title: 'Email',
              value: 'Rapsann@gmail.com',
            ),

            const SizedBox(height: 15),

            // NO HP
            profileItem(
              icon: Icons.phone_outlined,
              title: 'No. HP',
              value: '+62 812-3456-7890',
            ),

            const SizedBox(height: 15),

            // SOCIAL MEDIA
            profileItem(
              icon: Icons.public,
              title: 'Social Media',
              value: '@Zbadeboo',
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // COMPONENT PROFILE ITEM
  Widget profileItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F3F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF005A9C)),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const SizedBox(height: 5),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
